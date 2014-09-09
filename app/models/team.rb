class Team < ActiveRecord::Base
  has_many :team_members
  has_many :users, through: :team_members
  belongs_to :leader, :class_name => User

  validates :name, :presence => true, :uniqueness => true

  def leader_name
    name = "No Leader"
    name = leader.email unless leader.nil?
    name
  end
end
