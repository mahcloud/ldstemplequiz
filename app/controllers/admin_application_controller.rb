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
    redirect_to new_user_session_path unless current_user.is_a? Admin
  end

  helper_method :require_admin
end
