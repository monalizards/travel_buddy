class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :show, :update]

  def show
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
