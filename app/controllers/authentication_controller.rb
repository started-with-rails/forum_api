class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    token = AuthenticateUser.call(authentication_params)
 
    unless token.nil?
      render json: { auth_token: token }
    else
      render json: { error:  "Invalid username or password" }, status: :unauthorized
    end
  end


  private

  def authentication_params
    params.permit(:username, :password)
  end


 end