class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    token = AuthenticateUser.call(params[:username], params[:password])
 
    unless token.nil?
      render json: { auth_token: token }
    else
      render json: { error:  "Invalid username or password" }, status: :unauthorized
    end
  end

 end