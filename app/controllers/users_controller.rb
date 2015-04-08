class UsersController < ApplicationController
  before_action :authenticate_visitor!, :is_same_user, only: [:update, :destroy]

  def new
    @user= User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Account successfully updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'Your account was successfully destroyed'
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :photo
    )
  end

  def is_same_user
    if current_user.id != params[:id]
      flash[:alert] = "You cannot modify another user's account"
      redirect_to user_path(params[:id])
    end
  end
end