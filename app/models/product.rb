class Product < ActiveRecord::Base
	acts_as_votable
 	acts_as_taggable
 	has_many :images
end
