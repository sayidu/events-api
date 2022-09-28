# frozen_string_literal: true

module Api
  class AuthController < BaseController
    skip_before_action :authenticate_user

    def create
      @user = User.find_by_email(params[:email])
      return unauthorized unless @user&.authenticate(params[:password])

      token = ::Auth::Jwt.encode_token({ email: @user.email })
      render json: { token: token }, status: :ok
    end

    def destroy
      ::Auth::Jwt.encode_token({ email: @user.email, exp: Time.now })
    end
  end
end
