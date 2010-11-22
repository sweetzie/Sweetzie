module SiteHelper
  
  def show_feed_item(user, activity, target, activity_id)
    case activity
      when 1
        render :partial => 'feed/grab', :locals => { :user => user, :grab => target, :activity_id => activity_id }
      when 2
        render :partial => 'feed/relationship', :locals => { :friender => user, :friended => target }        
      when 3
        render :partial => 'feed/comment'
      when 5
        render :partial => 'feed/new_item', :locals => { :user => user, :item => target }
      when 6
        render :partial => 'feed/review', :locals => { :user => user, :review => target }
    end
  end
  
end
