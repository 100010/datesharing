class UsersController < ApplicationController

  def show
    user = current_user.planner #プランナー取得
    @plans = user.plans.order(created_at: :desc).limit(5) unless !user
  end

  def plans
    @plans = current_user.planner.plans.all
  end
end
