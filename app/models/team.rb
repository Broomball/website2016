class Team < ApplicationRecord
  has_many :playerteams
  has_many :players, :through => :playerteams

  validates_presence_of :name

end
