class Admin::SessionsController < Admin::Base

  before_action :authorize ,only: [:destroy]

  def new
    @form = Admin::LoginForm.new
  end

  def create
    @form = Admin::LoginForm.new(login_params)
    staff = Staff.find_by(email: @form.email)
    unless staff && staff.authenticate(@form.password)
      flash.alert = 'メールアドレスかパスワードが間違っています'
      return render action: 'new'
    end

    staff_log = set_logs(staff,'ログイン')

    return render action: 'new' unless staff_log.save
    session[:staff_id] = staff.id
    flash.notice = "#{staff.name}がログインしました"
    redirect_to staffs_path
  end

  def destroy
    session.delete(:staff_id)
    flash.notice = "ログアウトしました。"
    redirect_to staff_login_path
  end

  private

  def login_params
    params[:admin_login_form].permit(:email,:password)
  end

end
