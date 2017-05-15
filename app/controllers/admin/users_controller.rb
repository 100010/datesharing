class Admin::UsersController < Admin::Base
  before_action :authorize

	def index
		@users = User.all.order(created_at: :desc)
	end

  def edit
    @user = User.find(params[:id])
  end
end
