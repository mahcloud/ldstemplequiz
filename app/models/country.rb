class Country < ActiveRecord::Base
  has_many :states
  has_many :temples
  belongs_to :continent

  validates :name, :presence => true, :uniqueness => true
  validates :continent_id, :presence => true
end
