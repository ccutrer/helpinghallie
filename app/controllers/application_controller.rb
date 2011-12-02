class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_user
    redirect_to root_path unless %w{cody@cutrer.us neciamunro@hotmail.com}.include?(session[:user])
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
