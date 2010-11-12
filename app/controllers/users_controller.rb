class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:show, :new, :create, :index, :activate]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_login(params[:id])
    @items = @user.items
    @activities = @user.activities.paginate :page => params[:page], :per_page => 15, :order => 'created_at DESC'
  end
  
  def edit
    @user = User.find_by_login(params[:id])
  end
  
  def update 
      @user = User.find_by_login(params[:id])
        if @user.update_attributes(params[:user])
          redirect_to(@user)
          flash[:notice] = "Your settings have been successfully updated!"
        else
          render "edit"
          flash[:notice] = "Something went wrong..."
        end
  end
  
  # render new.rhtml
  def new
    @user = User.new()
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
  
  def following
    @title = "Following"
    @user = User.find_by_login(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find_by_login(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  def grabs
    @title = "Grabs"
    @user = User.find_by_login(params[:id])
    @grabs = @user.grabs
    render 'show_grabs'
  end
  
  def comments
    @title = "Comments"
    @user = User.find_by_login(params[:id])
    @comments = @user.comments
    render 'show_comments'
  end  
  
  def reviews
    @title = "Reviews"
    @user = User.find_by_login(params[:id])
    @reviews = @user.reviews
    render 'show_reviews'
  end
  
end
