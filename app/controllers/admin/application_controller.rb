class Admin::ApplicationController < ActionController::Base
  layout 'admin_application'


  private

  def authorize
    unless current_staff
      flash.alert =  '管理者としてログインしてください。'
      redirect_to staff_login_path
    end
  end

  def set_logs(staff , action)
      staff_log = staff.staff_logs.build
      staff_log.ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
      staff_log.username = staff.name
      staff_log.action = action
      return staff_log
  end

end
