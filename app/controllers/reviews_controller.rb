class ReviewsController < ApplicationController
  before_action :set_review, except: [:new, :create]

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_review
    @review = Review.find(params[restaurant_id])
  end

  def review_params
    params.require(:review)
          .permit(:content, :rating)
  end
end
