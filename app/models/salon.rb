class Salon < ActiveRecord::Base
	acts_as_votable
 	acts_as_taggable_on :topics
 	
	geocoded_by :address
	after_validation :geocode
end
