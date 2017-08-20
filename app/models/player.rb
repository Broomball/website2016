class Player < ApplicationRecord
  searchkick word_start: [:first_name, :last_name, :mtu_id]

  has_many :player_games
  has_many :games, :through => :player_games

  has_many :player_teams
  has_many :teams, :through => :player_teams

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

  def full_name
      "#{first_name} #{last_name}"
    end

  def search_data
    {
      full_name: full_name,
      first_name: first_name,
      last_name: last_name,
      mtu_id: mtu_id
    }
  end


  private
    def image_size_validation
      errors[:profile_pic] << "should be less than 500KB" if profile_pic.size > 0.5.megabytes
    end

end
