module ExceptionHandler
  extend ActiveSupport::Concern

   # Custom exception handler methods
  included do
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordInvalid,    with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found   
    rescue_from ActionController::RoutingError, :with => :route_not_found
    rescue_from ActionController::ParameterMissing, with: :render_bad_request
  end

  def invalid_route
    raise ActionController::RoutingError.new("No route matches #{params[:path]}")
  end

  private

  def render_error(exception)
    render json: {
      status: 500,
      error:  'Internal server error',
      message: exception
    }
  end

  def route_not_found(exception)
    render json: {
      status: 404,
      error:  'Not Found',
      message: exception
    }
  end

  def record_not_found(exception)
    render json: {
      status: 403,
      error:  'Record not found',
      message:  exception
    }
  end

  def invalid_record(exception)
    render json: {
      status: 401,
      error: 'Invalid Record',
      message:  exception
    }
  end

  def render_bad_request(e)
    render json: {
      status: 400,
      error: 'Bad request',
      message:  exception
    }
  end



end