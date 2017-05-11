module HttpAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :http_authenticate
  end

  def http_authenticate
    # return true unless Rails.env == 'production'

    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['ADMIN_USERNAME'].to_s && password == ENV['ADMIN_PASSWORD'].to_s
    end
  end
end