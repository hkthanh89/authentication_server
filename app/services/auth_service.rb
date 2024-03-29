class AuthService
  SECRET_KEY = ENV['SECRET_KEY_BASE']

  def encode(payload, secret = SECRET_KEY)
    token = JWT.encode payload, secret, 'HS256'
  end

  def decode(token, secret = SECRET_KEY)
    decoded_token = JWT.decode token, secret, true, { algorithm: 'HS256' }
    decoded_token[0]
  rescue JWT::DecodeError, JWT::VerificationError
    nil
  end
end