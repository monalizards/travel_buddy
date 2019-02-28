class ReviewsController < ApplicationController
  before_action :find_review, only: [:update, :destroy]
  before_action :find_trip

  def create
    @review = Review.new(review_params)
    @review.trip = @trip

    authorize @review

    if @review.save
      redirect_to @trip
    else
      render 'trips/show'
    end
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to @trip
    else
      render 'trips/show'
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to @trip
  end

  private

  def review_params
    params.require(:review).permit(:comment, :user_id)
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
