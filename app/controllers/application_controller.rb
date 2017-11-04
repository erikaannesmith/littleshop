class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end


  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end

  def current_admin?
    current_user && current_user.admin?
  end

 def login(user)
   session[:user_id] = user.id
 end

 def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 def logged_in?
   !current_user.nil?
 end

 def auth
   redirect_to login_url, alert: 'You must login to access that page' unless logged_in?
 end

end
