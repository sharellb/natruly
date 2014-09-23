class Salon < ActiveRecord::Base
	acts_as_votable
 	acts_as_taggable_on :topics
 	
 	validates_presence_of :address, :name
 	
	geocoded_by :address
	after_validation :geocode

end
