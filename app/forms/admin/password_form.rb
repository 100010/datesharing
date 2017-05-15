class Admin::PasswordForm
  include ActiveModel::Model

  attr_accessor :password,:password_confirmation

  validates :password,presence: true, length: {minimum: 6 },confirmation: true
  validates :password_confirmation,presence: true

end
