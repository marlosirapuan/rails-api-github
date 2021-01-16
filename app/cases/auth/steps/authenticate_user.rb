# frozen_string_literal: true

class Auth::Steps::AuthenticateUser < Micro::Case
  attributes :params

  def call!
    user = find_user(params[:email], params[:password])

    return Success(result: { token: encode_jwt(user) }) if user

    Failure(:not_authorized, result: { message: :not_authorized })
  end

  private

  def find_user(email, password)
    user = User.find_by(email: email)
    return user if user&.authenticate(password)
  end

  def encode_jwt(user)
    ::JsonWebToken.encode(user_id: user.id)
  end
end
