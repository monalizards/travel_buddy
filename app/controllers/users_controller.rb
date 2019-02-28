class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :trips]
  before_action :authorize_user, only: [:edit, :show, :update, :trips]

  def show
    @o_trips = Trip.where(organizer: @user)
    @p_trips = Participation.where(user: @user).map { |p| p.trip }
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User is successfully updated.'
    else
      render :edit
    end
  end

  def trips
    @o_trips = Trip.where(organizer: @user)
    @p_trips = Participation.where(user: @user).map { |p| p.trip }
  end

  private

  def authorize_user
    authorize @user
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :photo)
  end
end
