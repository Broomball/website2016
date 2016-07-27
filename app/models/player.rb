class Player < ActiveRecord::Base
  #TODO: create lambdas
  #lambda to search for player (returns array of player objects
  #that have the substring of "query" in it)
  scope :search, lambda {|query|
    where(["full_name LIKE ?", "%#{query}%"])  
  }
end
