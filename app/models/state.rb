class State < ActiveRecord::Base
  has_many :temples
  belongs_to :country

  validates :name, :presence => true, :uniqueness => true
end
