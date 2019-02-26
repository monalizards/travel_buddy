class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def show
    authorize @trip
  end

  def new
    @trip = Trip.new

    authorize @trip
  end

  def edit
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    @trip.organizer = current_user

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    authorize @trip
    @trip = Trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    authorize @trip
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