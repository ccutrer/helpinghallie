class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    reset_session
    session[:user] = request.env['omniauth.auth'].info.email
    redirect_to root_path
  end
end
