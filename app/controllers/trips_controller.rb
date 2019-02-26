class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.organizer = User.all.sample

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    @trip = Trip.update(trip_params)

    redirect_to trips_path
  end

  def destroy
    @trip.destroy

    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :destination, :start_date, :end_date, :budget, :max_participants)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
