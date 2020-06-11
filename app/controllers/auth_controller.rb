class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      token = AuthService.new.encode({ id: user.id, email: user.email })
      render json: { token: token }, status: 200
    else
      render json: { message: 'Invalid credentials' }, status: 400
    end
  end

  def verify
    token = request.headers['Authorization'].split('Bearer ')[1]
    if AuthService.new.decode(token)
      render :head
    else
      render json: { message: 'Invalid token' }, status: 400
    end
  end
end