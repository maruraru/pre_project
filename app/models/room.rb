class Room < ApplicationRecord
  belongs_to :hotel

  validates :roomtype, :price, :description, presence: true
  validates_numericality_of :price, :on => :create
end
