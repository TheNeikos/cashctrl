class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new new_user_params

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  private

  def new_user_params
    params.require(:user).permit(:name, :public_key, :email, :password)
  end
end
