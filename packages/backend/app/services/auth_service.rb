# frozen_string_literal: true

# Service to perform authentication
class AuthService
  def initialize(email, password)
    @email = email
    @password = password
  end

  def perform
    user = User.find_by(email: @email)
    if user&.authenticate(@password)
      user_authenticated = payload(user)
      status = user_authenticated.present? ? 200 : 401
      { message: user_authenticated, status: status }
    else
      { message: { errors: ['Invalid username/password'] }, status: :unauthorized }
    end
  end

  private

  def payload(user)
    return nil unless user&.id

    {
      auth_token: JsonWebToken.encode({ user_id: user.id }),
      user: { id: user.id, email: user.email }
    }
  end
end
