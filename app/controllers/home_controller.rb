class HomeController < ApplicationController
  def index
    @latest_plans = Plan.latest() #最新のプラン
  end
end
