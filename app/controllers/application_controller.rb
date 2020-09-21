class ApplicationController < ActionController::Base
  include Pagy::Backend

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
