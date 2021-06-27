class UsersController < ApplicationController
  before_action :authorize_request, except: :create
 
  def create
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.try(:id))
      render json: { auth_token: token}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
