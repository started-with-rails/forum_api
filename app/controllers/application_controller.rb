class ApplicationController < ActionController::API
  include ExceptionHandler
  before_action :authenticate_request
  attr_reader :current_user
  
  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers)
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
