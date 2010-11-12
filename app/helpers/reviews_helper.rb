module ReviewsHelper
  
  def find_review(id)
    review = Review.find_by_id(id)
    return review
  end
  
  def find_review_item(id)
    review = Review.find_by_id(id)
    return review.item
  end
  
end
