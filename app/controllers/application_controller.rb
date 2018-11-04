class ApplicationController < ActionController::API
  def restrict_access
    api_key = ApiKey.find_by(access_token: params[:access_token])
    head :unauthorized unless api_key || Rails.env.test?
  end
end
