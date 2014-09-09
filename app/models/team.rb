class Team < ActiveRecord::Base
  has_many :team_members
  has_many :users, through: :team_members
  belongs_to :leader, :class_name => User

  validates :name, :presence => true, :uniqueness => true
end
