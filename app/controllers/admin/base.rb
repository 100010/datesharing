class Admin::Base < Admin::ApplicationController

  def current_staff
      @current_staff ||= Staff.find_by(id: session[:staff_id])
  end

  def logged_in?
    !!current_staff
  end
  helper_method :current_staff , :logged_in?
end
