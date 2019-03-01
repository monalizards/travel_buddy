class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy, :book, :message]

  def index
    if params[:query].present?
      @trips = policy_scope(Trip).search_by_destination(params[:query])
    else
      @trips = policy_scope(Trip).where.not(latitude: nil, longitude: nil)
    end

    @trips.order(created_at: :desc)
  end

  def show
    authorize @trip

    @markers = [{
      lng: @trip.longitude,
      lat: @trip.latitude }]

    @weather = Rails.configuration.open_weather_api.current lon: @trip.longitude, lat: @trip.latitude
    @message = Message.new
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
      redirect_to trip_path(@trip), notice: 'You created a trip!'
    else
      flash[:alert] = "Something went wrong. Please review the errors"
      render :new
    end
  end

  def update
    authorize @trip
    if @trip.update(trip_params)
      redirect_to trip_path(@trip), notice: 'Trip info updated!'
    else
      flash[:alert] = "Something went wrong. Please review the errors"
      render :edit
    end
  end

  def destroy
    authorize @trip
    @trip.destroy
    redirect_to trips_path
  end

  def book
    @participation = Participation.new
    @participation.user = current_user
    @participation.trip = @trip
    if @participation.save
      flash[:notice] = "Cool! You're book onto this trip"
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Sorry! #{@participation.errors.full_messages.first}"
      redirect_to trip_path(@trip)
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :destination, :start_date, :end_date, :budget, :max_participants, :photo)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
