class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy, :book]

  def index
    @trips = Trip.where.not(latitude: nil, longitude: nil)

    @trips = policy_scope(Trip).order(created_at: :desc)

    #TO DO MAP FOR INDEX

    # @markers = @flats.map do |flat|
      # {
        # lng: flat.longitude,
        # lat: flat.latitude
      # }
    # end
  end

  def show
    authorize @trip

    @markers = [{
      lng: @trip.longitude,
      lat: @trip.latitude }]
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
      flash[:alert] = "Please review the errors"
      render :new
    end
  end

  def update
    authorize @trip
    if @trip.update(trip_params)
      redirect_to trips_path
    else
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
