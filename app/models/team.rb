class Team < ApplicationRecord
  has_many :player_teams
  has_many :players, :through => :player_teams

  has_many :home_games, :foreign_key => :home_team_id, :class_name => :Game
  has_many :away_games, :foreign_key => :away_team_id, :class_name => :Game

  validates_presence_of :name

end
