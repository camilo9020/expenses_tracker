class Admin::TripsController < ApplicationController
    before_action :authenticate_employee!

    def index
      @trips = Trip.paginate(page: params[:page], per_page: 10)
    end

    def show
      @trip = Trip.find(params[:id])
    end

    def new
      @trip = Trip.new
    end

    def create
      @trip = Trip.new(trip_params)
      if @trip.save
        EmployeeMailer.new_trip(@trip).deliver_now
        flash[:success] = 'The trip was created successfully and the employee was notificated'
        redirect_to admin_trips_path
      else
        render :new
      end
    end

    def edit
      @trip = Trip.find(params[:id])
    end

    def update
      @trip = Trip.find(params[:id])
      if @trip.update(trip_params)
        flash[:success] = 'The trip was edited'
        redirect_to admin_trips_path
      else
        render :edit
      end
    end

    def destroy
      @trip = Trip.find(params[:id])
      @trip.destroy
      flash[:success] = 'The was deleted'
      redirect_to admin_trips_path
    end

  private
    def trip_params
      params.require(:trip).permit(:destiny, :begin_date, :end_date, :employee_id)
    end

end
