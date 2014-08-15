class Photo < ActiveRecord::Base
  belongs_to :temple

  validates :link, :presence => true
  validates :temple_id, :presence => true
end
