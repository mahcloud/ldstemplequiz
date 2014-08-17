class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :temple

  validates :temple_id, :presence => true
  validates :guess_id, :presence => true
  validates :correct, :inclusion => {:in => [true, false]}
end
