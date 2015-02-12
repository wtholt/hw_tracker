class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({location_lesson_ids: []}, :name, :github, :email, :password, :password_confirmation, :admin, :location_id, :location_lesson_id)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({location_lesson_ids: []}, :name, :github, :email, :password, :password_confirmation, :admin, :location_id, :location_lesson_id)}
  end

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:notice] = "Access denied."
  #   redirect_to root_url
  # end
end
