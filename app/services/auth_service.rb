class AuthService
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def encode(payload, secret = SECRET_KEY)
    token = JWT.encode payload, secret, 'HS256'
  end
end