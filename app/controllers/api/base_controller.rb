# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :bad_request
    rescue_from ActionController::UnpermittedParameters, with: :bad_request

    private

    def page_no(page)
      page.present? ? page : 1
    end

    def authenticate_user
      decoded_token = ::Auth::Jwt.decode_token(bearer_token)
      @user = User.find_by_email(decoded_token.first['email'])

      return unauthorized unless @user.present?
    rescue JWT::DecodeError
      unauthorized
    rescue JWT::ExpiredSignature
      unauthorized
    end

    def unauthorized
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end

    def not_found
      render json: { errors: ['Not found'] }, status: :not_found
    end

    def bad_request(exception)
      render json: { errors: [exception.message] }, status: :bad_request
    end

    def bearer_token
      return if request.headers['Authorization'].nil?

      request.headers['Authorization'].split.last
    end
  end
end
