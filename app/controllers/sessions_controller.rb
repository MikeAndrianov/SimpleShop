class SessionsController < ApplicationController
  def new
  end

  # Simple authentication. It doesn't necessarily to create something more advanced than that for current project
  #
  def create
    session[:password] = params[:password]
    flash[:notice] = "You successfully logged in #{ "as admin" if admin? }"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "You successfully logged out"
    redirect_to root_path
  end
end
