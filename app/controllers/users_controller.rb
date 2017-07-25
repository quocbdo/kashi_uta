class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authorize, except: [:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # add the line below to automatically login a new user
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
