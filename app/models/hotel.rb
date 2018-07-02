class Hotel < ApplicationRecord
	has_one :location
	has_many :comments

	has_many :rooms

	mount_uploader :photo, PhotoUploader
	validates :title, presence: true, length: {in: 5..20}, uniqueness: true
	validates :photo, presence: true
	accepts_nested_attributes_for :location
	
	accepts_nested_attributes_for :rooms, allow_destroy: true

end