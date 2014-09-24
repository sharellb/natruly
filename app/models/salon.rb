class Salon < ActiveRecord::Base
	acts_as_votable
 	acts_as_taggable
 	
 	validates_presence_of :address, :name
 	
	geocoded_by :address
	after_validation :geocode
	has_many :images
end
