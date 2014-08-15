class Continent < ActiveRecord::Base
  has_many :countries
  has_many :temples, :through => :countries

  validates :name, :presence => true, :uniqueness => true

  def has_temples?
    temples.count > 0
  end
end
