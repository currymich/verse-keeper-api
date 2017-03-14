class UsersController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 200, message: "'#{user.email}' created and logged in", user: user, token: token}
    else
      render json: {status: 422, user: user.errors}
    end
  end

  def login
    if params[:user][:email].include? "@"
      user = User.find_by(email: params[:user][:email])
    else
      user = User.find_by(username: params[:user][:email])
    end

    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 201, user: user, message: "'#{user.email}' logged in", token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def show
    render json: {status: 200, user: current_user}
  end
end
