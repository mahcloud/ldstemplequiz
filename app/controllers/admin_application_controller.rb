class AdminApplicationController < ::ApplicationController
  before_filter :store_location, :require_admin

  layout 'admin'

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render 'public/404'
  end

  def store_location
    return unless request.get? && !request.xhr?
    session[:previous_url] = request.fullpath 
  end

  protected

  def require_admin
    redirect_to new_admin_session_path unless current_admin.is_a? Admin
  end

  helper_method :require_admin

  def current_user
    current_admin
  end

  helper_method :current_user
end
