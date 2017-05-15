
class Plan < ApplicationRecord

	mount_uploader :main_image, ImageUploader

	#commentとの関連付け
	has_many :comments
	has_many :plan_details

	accepts_nested_attributes_for :plan_details #この行を追加

	#関連付け
	has_many :goods
	has_many :users , through: :goods

	#validationの作成
	validates	:title,
	presence: {message: "入力してください"}

	def self.latest(limit = 4)
		limit(limit).order(created_at: :desc)
	end

	def self.pager_created(page_id,limit)
		page(page_id).per(limit).order(created_at: :desc)
	end
	
end
