class Photo < ActiveRecord::Base
  belongs_to :temple

  validates :link, :presence => true
  validates :temple_id, :presence => true
  validates_uniqueness_of :link, :scope => :temple_id
end
