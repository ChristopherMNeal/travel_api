class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
      message: "This destination has been updated successfully."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy
      render status: 200, json: {
      message: "This quote has been deleted successfully."
      }
    end
  end

  def destination_params
    params.permit(:name, :city, :country)
  end
end