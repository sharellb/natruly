class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  has_many :images
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, 
  							uniqueness: true,
  							format: {
  								with: /\A[a-zA-Z\-\_]+\Z/,
  								message: "must be formatted correctly."
  							}
end
