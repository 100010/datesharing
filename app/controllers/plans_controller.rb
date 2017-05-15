class PlansController < ApplicationController

	before_action :set_plan, except: [:index,:new,:create]

	def index
		@plans = Plan.pager_created(params[:page],12)
	end

	def show
		good = Good.new
		@good = @plan.goods.build
		@isGood = good.isGood?(current_user.id,@plan.id)
	end

	def new
		@plan = current_user.planner.plans.new
		@plan.plan_details.build
	end


	def create
		@plan = current_user.planner.plans.new(plan_params)

		@plan.status = 1 if params[:commit] === '登録する'

		@plan.status = 0 if params[:commit] === '下書き保存'

		return render 'new' unless @plan.save #後置き if文でシンプル

		redirect_to plans_path

	end

	def edit

	end

	def update
		return render 'edit' unless @plan.update(plan_params) #後置き if文でシンプル

		redirect_to plans_path

	end

	def destroy
		@plan.destroy
		redirect_to plans_path
	end





private
#安全上、登録したものに対して、一度フィルターをかけてあげるおまじない
	def plan_params
		params[:plan].permit(
			:title,:place,:main_image,:start_date,:end_date,:description,
			:start_favorability_rating,:end_favorability_rating,:status,
			plan_details_attributes: [:name, :place,:start_time,:end_time,:price,:content,:status]
		)
	end

#urlで渡ってきた数字はparamsで取得できる

	def set_plan
		@plan = Plan.find(params[:id])
	end

end
