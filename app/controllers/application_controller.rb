class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::ActiveRecordError, with: :record_not_found

  private

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end

end
