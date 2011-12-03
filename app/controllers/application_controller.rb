class ApplicationController < ActionController::Base
  protect_from_forgery

  def user
    @user = session[:user] if %w{cody@cutrer.us neciamunro@hotmail.com}.include?(session[:user])
  end

  def require_user
    redirect_to root_path unless user
  end

  def index
  end

  def contact
  end

  def donations
  end

  def story
  end

  def tshirts
  end
end
