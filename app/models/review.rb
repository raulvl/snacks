class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :product_id, presence: true, uniqueness: { scope: :user_id, message: "You've reviewed this product!" }
  validates :content, presence: true, length: { maximum: 140 }
  validates :review_grade, presence: true, inclusion: {in: [1,2,3,4,5]}
  accepts_nested_attributes_for :product
end
