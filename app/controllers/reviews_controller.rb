class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index #DONE
    @reviews = Review.all
  end

  def new #DONE
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create #DONE
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    redirect_back fallback_location: root_path
  end

  def edit #DONE
    @review = Review.find(params[:id])
  end

  def update #DONE
    @review.update(review_params)
    redirect_to review_path
  end

  def destroy #DONE
    @review.destroy
    redirect_to restaurant_reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant)
  end
end
