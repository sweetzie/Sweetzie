require 'digest/sha1'

class User < ActiveRecord::Base

  # Includes

  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  # Associations
  
  has_many :grabs, :dependent => :destroy
  has_many :items, :through => :grabs

  has_many :activities
  
  has_attached_file :avatar

  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  # Validations
  
  validates_presence_of     :first_name
  validates_length_of       :first_name,    :within => 3..20
  validates_format_of       :first_name, :with => Authentication.name_regex, :message => Authentication.bad_name_message
   
  validates_presence_of     :last_name
  validates_length_of       :last_name,    :within => 3..20
  validates_format_of       :last_name, :with => Authentication.name_regex, :message => Authentication.bad_name_message
      
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  #validates_presence_of :invitation_id, :message => "is required."
  #validates_uniqueness_of :invitation_id

  before_create :make_activation_code 

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :first_name, :last_name
  
  # change style of urls
  
  def to_param
    login
  end
  
  ##------------------ Reltionships ------------------##
  
  # Checks to see if the specified user is already being followed
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  # Create a following relationship with the specified user
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  # Destroy a following relationship
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end  
  
  ##------------------ Grabs ------------------##
  
  # Grab a new item
  
  def grab!(item)
    grabs.create!(:item_id => item.id)
  end
  
  
  ## ----------------------- API -------------------- ##
  
  # enable api usage
  
  def enable_api!
    self.generate_api_key!
  end
  
  #disable api usage
  
  def disable_api!
    self.update_attribute(:api_key, "")
  end
  
  # check and see if api is enabled
  
  def api_is_enabled?
    !self.api_key.empty?
  end
  
  ##------------------ Authentication and Registration ------------------##
  
  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end
  
  def recently_activated?
    @activated
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end  
  
    protected
      def make_activation_code
            self.activation_code = self.class.make_token
      end
      
      def secure_digest(*args)
        Digest::SHA1.hexdigest(args.flatten.join('--'))
      end
      
      def generate_api_key!
        self.update_attribute(:api_key, secure_digest(Time.now, (1..10).map{ rand.to_s }))
      end
      
end
