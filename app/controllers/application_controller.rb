class ApplicationController < ActionController::API
  include ErrorHandler
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    raise ErrorHandler::MissingHeader if request.headers['Authorization'].nil?

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
