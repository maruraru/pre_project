class Hotel < ApplicationRecord
	has_one :location, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :rooms, dependent: :destroy

	attr_accessor :title, :rooms_attributes 

	mount_uploader :photo, PhotoUploader
	validates :title, presence: true, length: {in: 5..20}, uniqueness: true
	validates :photo, presence: true
	accepts_nested_attributes_for :location, allow_destroy: true
	
	accepts_nested_attributes_for :rooms, allow_destroy: true

end