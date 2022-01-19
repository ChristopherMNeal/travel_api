class ReviewsController < ApplicationController
  def index
    # @reviews = Review.all
    @reviews = Review.paginate(page: params[:page], per_page: 5)
    ratings = params[:ratings]
    most = params[:most_reviews]
    city = params[:city]
    random = params[:random]
    country = params[:country]
    if city
      @reviews = Review.city_search(city)
    elsif country
      @reviews = Review.country_search(country)
    elsif ratings
      @reviews = Review.best_rating
    elsif most
      @reviews = Review.most_reviews
    elsif random
      @reviews = Review.random
    end
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    user_name = params[:user_name]
    @review = Review.find(params[:id])
    if user_name == @review.user_name
      if @review.update!(review_params)
        render status: 200, json: {
        message: "This review has been updated successfully."
        }
      end
    else
      render json: { error: "You are unauthorized" }
    end
  end

  def destroy
    user_name = params[:user_name]
    @review = Review.find(params[:id])
    if user_name == @review.user_name
      if @review.destroy
        render status: 200, json: {
        message: "This review has been deleted successfully."
        }
      end
    else
      render json: { error: "You are not the authorized user" }
    end
  end

  def review_params
    params.permit(:content, :author, :rating, :landmark, :city, :country, :user_name)
  end
end