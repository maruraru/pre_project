class Room < ApplicationRecord
	belongs_to :hotel

	validates :roomtype, :price, :description, presence: true

end