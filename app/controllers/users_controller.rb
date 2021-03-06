class UsersController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 200, message: "#{user.name} created and logged in", user: user, token: token}
    else
      render json: {status: 422, message: "Bad parameters"}
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

      render json: {status: 201, user: user, message: "#{user.name} logged in", token: token}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
  end

  def show
    render json: {status: 200, user: current_user}
  end

  private

    def token(id, email)
      JWT.encode(payload(id, email), 'someawesomesecret', 'HS256')
    end

    def payload(id, email)
      {
        exp: (Time.now + 1.day).to_i,
        iat: Time.now.to_i,
        iss: 'wdir-matey',
        user: {
          id: id,
          email: email
        }
      }
    end

    def user_params
      params.required(:user).permit(:email, :password, :username, :name)
    end
end
