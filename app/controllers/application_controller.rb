class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_user
  protected
  def set_user
    @user = User.find(session[:id]) if @user.nil? && session[:id]
  end
  def login_required
    return true if @user
    access_denied
    return false
  end
  def access_denied
    session[:return_to] = request.request_uri
    flash[:error] = 'Oops. You need to login to continue!'
    redirect_to :controller => 'user', :action => 'login'
  end
end
