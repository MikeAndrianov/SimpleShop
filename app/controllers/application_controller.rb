class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  protected 

  def admin?
    session[:password] == "admin"
  end

  def check_permissions
    unless admin? 
      flash[:notice] = "You haven't rights for this"
      redirect_to root_path
    end
  end
end
