class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.password_confirmation = user.password
    user.save

    render json: {}, status: 201
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
