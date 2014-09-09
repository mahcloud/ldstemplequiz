class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  has_many :team_members
  has_many :teams, through: :team_members 
  validates :email, :presence => true, :uniqueness => true, :unless => :is_guest?
  validates :type, :presence => true

  def is_guest?
    self.is_a? Guest
  end
end