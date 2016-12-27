class Api::V1::TripsController < ApplicationController
  before_filter :restrict_access
  def index
    trips = Trip.all
    render json: trips
  end

  def show
    trip = Trip.find(params[:id])
    render json: trip
  end

  private
    def restrict_access
      employee = Employee.find_by(email: params[:email])
      head :unauthorized unless employee && employee.api_token == params[:api_token]
    end
end
