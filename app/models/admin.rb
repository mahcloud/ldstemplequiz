class Admin < User
  validates :email, :presence => true, :uniqueness => true
  validates :type, :presence => true
end
