class RestaurantsController < ApplicationController
  before_action :set_restaurant, except: [:index, :new, :create]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
    @avg_rating = averager(@reviews)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def averager(reviews)
    rate_arr = []
    reviews.each do |review|
      rate_arr << review.rating
    end
    if reviews.size.nil?
      0
    else
      (rate_arr.inject { |sum, x| sum + x }
        .to_f / rate_arr.size).round(1)
    end
  end

  def restaurant_params
    params.require(:restaurant)
          .permit(:name, :address, :phone_number, :category)
  end
end
