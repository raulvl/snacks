class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :category
  
  #attr_accessible :product_id
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  
  # Defines a proto-feed.
  # See "Following users" for the full implementation.
  def feed
    Review.where("product_id = ?", id)
  end
  

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end  

end
