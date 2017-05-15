class Comment < ApplicationRecord
	#userとの関連付け
	belongs_to :user
	#planとの関連付け
	belongs_to :plan
end
