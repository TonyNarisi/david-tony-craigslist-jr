module SessionHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    true if current_user
  end

  def require_user
    redirect_to '/login' unless logged_in?
  end
end
