class AuthenticateUser < ApplicationService

  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :username, :password

  def user
    user =  User.where(username: username).or(User.where(email: username)).first
    return user if user&.authenticate(password)
    nil
  end
end