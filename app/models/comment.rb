class Comment < ApplicationRecord
	belongs_to :hotel
	belongs_to :user

	validates :comment, presence: true
end