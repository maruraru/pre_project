class Room < ApplicationRecord
	belongs_to :hotel

	attr_accessor :roomtype, :price, :description, :hotel_id
end