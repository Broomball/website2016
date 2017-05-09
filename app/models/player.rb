class Player < ActiveRecord

  has_and_belongs_to_many :teams


  #TODO: create lambdas
  #lambda to search for player (returns array of player objects
  #that have the substring of "query" in it)
  scope :search, lambda {|query|
    where(["full_name LIKE ?", "%#{query}%"])
  }

  #Used for listing players on teams TODO: make work with schema
  scope :teamsort, lambda {|team| where["team_id = ?", "%#{team}%"]}
end
