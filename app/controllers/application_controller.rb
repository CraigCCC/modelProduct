class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def handle_record_not_found
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end
