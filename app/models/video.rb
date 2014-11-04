class Video < ActiveRecord::Base
 	acts_as_votable
 	acts_as_taggable

	YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
 
	validates :link, presence: true, format: YT_LINK_FORMAT
	before_create do 
	  uid = link.match(YT_LINK_FORMAT)
	  self.uid = uid[2] if uid && uid[2]
	 
	  if self.uid.to_s.length != 11
	    self.errors.add(:link, 'is invalid.')
	    false
	  elsif Video.where(uid: self.uid).any?
	    self.errors.add(:link, 'is not unique.')
	    false
	  else
	    get_additional_info
	  end
	end

	
	private
 
	def get_additional_info
	  begin
	    client = YouTubeIt::OAuth2Client.new(dev_key: 'AIzaSyDJoPnYIX31aGFZfvrC-iN_I5-COroXDcE')
	    video = client.video_by(uid)
	    self.title = video.title
	    self.author = video.author.name
	  rescue
	    self.title = '' ; self.author = ''
	  end
	end
end
