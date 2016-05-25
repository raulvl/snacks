class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  

  def create
   @product = Product.find(params[:product_id])
   @review = @product.reviews.build(review_params)
   current_user.reviews << @review
   if @review.save
     flash[:success] = "Review submitted"
     redirect_to product_path(@product)
   else
     #@feed_items = []   
     @reviews = []
     flash.now[:danger] = "Error: You've reviewed this product"
     render 'products/show'
   end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  private

    def review_params
      params.require(:review).permit(:content, :review_grade)
    end
    
    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
end
