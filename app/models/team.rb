class Team < ActiveRecord

  has_and_belongs_to_many :players
  belongs_to :league
  belongs_to :conference

end
