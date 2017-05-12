class Player < ApplicationRecord
  has_many :playergames
  has_many :games, :through => :playergames

  has_many :playerteams
  has_many :teams, :through => :playerteams

  mount_uploader :profile_pic, ImageUploader

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      player_hash = row.to_hash
      player = Player.where(mtu_id: player_hash["mtu_id"])

      if player.count == 1
        player.first.update_attributes(first_name: player_hash["first_name"], last_name: player_hash["last_name"], mtu_id: player_hash["mtu_id"])
      else
        Player.create(first_name: player_hash["first_name"], last_name: player_hash["last_name"], mtu_id: player_hash["mtu_id"])
      end
    end
  end

  private
    def image_size_validation
      errors[:profile_pic] << "should be less than 500KB" if profile_pic.size > 0.5.megabytes
    end

  #TODO: create lambdas
  #lambda to search for player (returns array of player objects
  #that have the substring of "query" in it)
  #scope :search, lambda {|query|
  #  where(["full_name LIKE ?", "%#{query}%"])
  #}

  #Used for listing players on teams TODO: make work with schema
  #scope :teamsort, lambda {|team| where["team_id = ?", "%#{team}%"]}
end
