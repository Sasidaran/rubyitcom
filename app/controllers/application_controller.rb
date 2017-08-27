class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  helper_method :current_user, :signed_in?, :is_admin?

  def login_required
  	current_user.present?
  end


  def signed_in?
    !!current_user
  end


  private

  def after_sign_in_path_for(resource)
    home_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else
      root_path
    end
  end

  
end
