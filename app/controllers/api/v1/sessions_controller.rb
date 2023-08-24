class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user.update(last_login_at: Time.now)
    if user && user.password == params[:password]
      render json: { message: 'Logged in successfully', user_id: user.id }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def all_users
    all_users = User.all
    render json: all_users, status: :ok
  end

end
