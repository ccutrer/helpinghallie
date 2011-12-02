class SessionsController < ApplicationController
  def create
    reset_session
    session[:user] = request.env['omniauth.auth'].info.email
    redirect_to root_path
  end
end
