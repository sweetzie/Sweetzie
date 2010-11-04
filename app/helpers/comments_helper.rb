module CommentsHelper
  def find_comments(id)
    activity = Activity.find_by_id(id)
    return activity
  end
end
