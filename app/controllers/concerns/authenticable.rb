# frozen_string_literal: true

module Authenticable
  def current_user
    return @current_user if @current_user

    decoded = handle_headers(request)

    @current_user =
      begin
        User.find(decoded[:user_id])
      rescue StandardError
        nil
      end
  end

  private

  def handle_headers(request)
    header = request.headers['Authorization']
    return nil if header.nil?

    decode(header)
  end

  def decode(header)
    JsonWebToken.decode(header)
  rescue StandardError
    nil
  end

  protected

  def authenticate_user
    head :forbidden unless current_user
  end

  def render_json(status, json = {})
    render status: status, json: json
  end
end
