class Admin::PlansController < Admin::Base
  before_action :authorize

	def index
		@plans = Plan.all
	end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update

    @plan = Plan.find(params[:id])
    return render 'edit' unless @plan.update(plan_params)

    staff_log = set_logs(current_staff,"デートプラン更新【ID:#{@plan.id}】")
    staff_log.save
    flash.notice = 'デートプランを更新しました'
    redirect_to edit_staff_plan_path(@plan.id)
  end

  private

  def plan_params
		params[:plan].permit(:title,:thubnail,:content,:BLOB,:closeness,:satisfaction)
	end
end
