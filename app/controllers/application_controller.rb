class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_organisation

  def load_organisation
    redirect_to root_path if current_organisation.blank?
  end

  def current_organisation
    @current_organisation ||= Organisation.find(session[:organisation_id])
  end
end
