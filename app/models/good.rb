class Good < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  def isGood?(user_id,plan_id)
    good = self.class.find_by(user_id: user_id,plan_id: plan_id)
    return unless good.blank? ? true : false;
  end

  def self.related_user_and_plan(user_id,plan_id)
    where(user_id: user_id).where(plan_id: plan_id)
  end

end
