# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern
  
  class MissingHeader < Exception; end
  class MissingToken < Exception; end
  class InvalidToken < Exception; end

  included do
    rescue_from MissingHeader, with: :missing_header
    rescue_from InvalidToken, with: :not_valid_token
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    #rescue_from StandardError, with: :error
  end

  private

    def missing_header
      render json: { message: I18n.t("errors.controllers.application.messages.missing_header"), status: 401 }, status: :unauthorized
    end

    def not_valid_token
      render json: { message: I18n.t("errors.controllers.application.messages.not_valid_token"), status: 401 }, status: :unauthorized
    end

    def not_found
      render json: { message: I18n.t("errors.controllers.application.messages.not_found"), status: 404 }, status: :not_found
    end
    
    def error
      render json: { message: I18n.t("errors.controllers.application.messages.error"), status: 500 }, status: :internal_server_error
    end
end
