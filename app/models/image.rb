class Image < ActiveRecord::Base
	belongs_to :user
	belongs_to :salon
	acts_as_taggable

	validates_presence_of :link
end
