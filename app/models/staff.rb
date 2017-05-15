class Staff < ApplicationRecord
  has_secure_password
  has_many :staff_logs

  validates :name,presence: true ,length: { maximum: 30 } ,allow_nil: true
  validates :email,presence: true , confirmation: true,length: { maximum: 100 },allow_nil: true
  validates :email_confirmation,presence: true,allow_nil: true
  validates :password,presence: true, length: {minimum: 6 },allow_nil: true
  validates :password_confirmation,presence: true,allow_nil: true
  validates :status,presence: true,allow_nil: true

  def is_admin
    return self.status === 1 ? true : false;
  end

  def get_status
    if self.status === 1
      return '管理者権限'
    elsif self.status === 2
      return '書き込み権限'
    else
      return '読み取り権限'
    end
  end
end
