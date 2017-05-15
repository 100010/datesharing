class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :goods
  has_many :plans , through: :goods

  attr_accessor :login

  #plannerと関連付け
  has_one :planner


  #devise宣言時の管理
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]


  # usernameでもemailでもログインできるよう変更
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  # usernameのvalidationを追加
  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 20 },
  format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}

#commentとuserの関連付け
  has_many :comments

end
