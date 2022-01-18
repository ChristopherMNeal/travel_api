class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    city = params[:city]
    country = params[:country]
    if city
      @reviews = Review.city_search(city)
    elsif country
      @reviews = Review.country_search(country)
    end
    json_response(@reviews)
  end

  # http://localhost:3000/reviews?country=texas

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
      message: "This review has been updated successfully."
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
      message: "This review has been deleted successfully."
      }
    end
  end

  def review_params
    params.permit(:content, :author, :rating, :landmark, :city, :country)
  end
end