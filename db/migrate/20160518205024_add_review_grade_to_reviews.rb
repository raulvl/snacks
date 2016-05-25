class AddReviewGradeToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :review_grade, :integer
  end
end
