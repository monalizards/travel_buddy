class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.trip
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create
    authorize @review
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def trips
  end

  private

  def review_params
    params.require(:review).permit()
  end
end
