class Temple < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  has_many :photos
  has_many :answers

  validates :name, :presence => true, :uniqueness => true
  validates :address, :presence => true
  validates :state_id, :presence => true
  validates :country_id, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :link, :presence => true
end
