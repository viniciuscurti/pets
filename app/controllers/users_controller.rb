class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p @user
    if @user.save
      redirect_to user_path(@user), notice: 'User has been successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to card_path(@user), notice: "User was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root path
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :photo)
  end

  def set_user
    @user = current_user
  end
end
end
