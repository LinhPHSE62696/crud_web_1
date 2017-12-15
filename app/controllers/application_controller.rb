class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	@user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
  	redirect_to login_path unless current_user
  end

  def require_edit
  	redirect_to login_path unless current_user.is_editable?
  end

  def require_delete
  	redirect_to login_path unless current_user.is_deletable?
  end

end
