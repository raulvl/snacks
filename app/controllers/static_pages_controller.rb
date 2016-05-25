class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @review = current_user.reviews.build 
      @feed_items = current_user.feed_home.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
