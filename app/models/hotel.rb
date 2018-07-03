class Hotel < ApplicationRecord
	has_one :location, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :rooms, dependent: :destroy

	
	mount_uploader :photo, PhotoUploader
	validates :title, presence: true, length: {in: 5..20}, uniqueness: true
	validates :photo, presence: true
	accepts_nested_attributes_for :location, allow_destroy: true
	
	accepts_nested_attributes_for :rooms, allow_destroy: true




	scope :highest_rated, ->{sort_by {|hotel| hotel.comments.average(:localrate)}.last(5).reverse}

	#=====for search form (i guess)=====
	def self.search(term)
	  	if term
   	 	 joins(:location).where('title ILIKE ? OR locations.country ILIKE ? OR locations.city ILIKE ?', "%#{term}%", "%#{term}%", "%#{term}%")
   	 	else
   		 all
  		end
	end
	#=====for search form (i guess)=====

end