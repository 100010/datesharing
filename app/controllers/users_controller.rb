class UsersController < ApplicationController

  def show
    user = current_user.planner #プランナー取得
    @plans = user.plans.order(created_at: :desc).limit(5) unless !user
  end

  def plans
    @plans = Plan.pager_created_by_planner(params[:page],12,current_user.planner.id)
  end
end
