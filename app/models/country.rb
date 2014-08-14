class Country < ActiveRecord::Base
  has_many :states
  has_many :temples, :through => :states

  validates :name, :presence => true, :uniqueness => true
end
