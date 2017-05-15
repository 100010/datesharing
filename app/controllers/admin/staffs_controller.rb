class Admin::StaffsController < Admin::Base

  before_action :authorize

  def index
    @logs = current_staff.staff_logs.order(created_at: :desc).limit(10)
  end

  def show
    @staff = Staff.find(params[:id])
    @logs = @staff.staff_logs.order(created_at: :desc).limit(10)
  end

  def member
    @staff = Staff.all.order(created_at: :desc)
  end

  def edit
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    return render action: 'new' unless @staff.save

    staff_log = set_logs(@staff,'スタッフ登録')
    staff_log.save

    flash.notice = '新しい管理者を登録しました'
    redirect_to staffs_path
  end

  def update
    return render action: 'show' unless current_staff.update(staff_params)
    staff_log = set_logs(current_staff,'基本情報更新')
    staff_log.save
    flash.notice = 'スタッフ情報を更新しました'
    redirect_to edit_staff_path(current_staff.id)
  end

  def repassword

    @passwordForm = Admin::PasswordForm.new
    return render unless request.patch?

    @passwordForm = Admin::PasswordForm.new(password_params)

    return render unless @passwordForm.valid?

    current_staff.password = @passwordForm.password
    current_staff.password_confirmation = @passwordForm.password_confirmation

    return render  unless current_staff.save
    staff_log = set_logs(current_staff,'パスワード変更')
    staff_log.save
    flash.notice = 'パスワードを更新しました'
    redirect_to staff_repassword_path

  end


  def log
    @logs = StaffLog.all.order(created_at: :desc)
  end

  private

  def staff_params
    params[:staff].permit(:name,:email,:email_confirmation,:password,:password_confirmation,:status)
  end

  def password_params
    params[:admin_password_form].permit(:password,:password_confirmation)
  end

end
