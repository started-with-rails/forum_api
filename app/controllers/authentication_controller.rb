class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:authenticate]
 
  def authenticate
    @token = AuthenticateUser.call(authentication_params)
    unless @token.nil?
      render json: { auth_token: @token, user: current_user }
    else
      render json: { error:  "Invalid username or password" }, status: :unauthorized
    end
  end

  def authorize_token
    render json: { user: current_user, auth_token: request.headers[:Authorization] }
  end


  private

  def authentication_params
    params.permit(:username, :password)
  end


  def current_user
    @current_user ||= User.find_by(username: params[:username])
  end


 end