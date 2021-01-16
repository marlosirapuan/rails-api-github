# frozen_string_literal: true

module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user =
      begin
        User.find(decoded[:user_id])
      rescue StandardError
        nil
      end
  end

  protected

  def authenticate_user
    head :forbidden unless current_user
  end

  def render_json(status, json = {})
    render status: status, json: json
  end
end
