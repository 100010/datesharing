class Admin::CommentsController < Admin::Base
  before_action :authorize

	def index
		@comments = Comment.all.order(created_at: :desc)
	end
end
