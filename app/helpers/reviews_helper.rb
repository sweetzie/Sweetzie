module ReviewsHelper
  def find_review(id)
    review = Review.find_by_id(id)
    return review.item.name
  end
end
