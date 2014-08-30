class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  validates :email, :presence => true, :unless => :is_guest?
  validates :type, :presence => true

  def is_guest?
    self.is_a? Guest
  end
end