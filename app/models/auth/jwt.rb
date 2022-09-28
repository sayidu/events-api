# frozen_string_literal: true

module Auth
  class Jwt
    def self.encode_token(payload = {}, exp: 48.hours.from_now.to_i, jti: nil)
      payload[:jti] = jti if jti.present?
      payload[:exp] = exp if exp.present?

      JWT.encode(
        payload,
        Rails.application.credentials[Rails.env.to_sym][:jwt_secret], 'HS256'
      )
    end

    def self.decode_token(token)
      JWT.decode(token, Rails.application.credentials[Rails.env.to_sym][:jwt_secret], 'HS256')
    end
  end
end
