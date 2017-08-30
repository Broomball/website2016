class Player < ApplicationRecord
  searchkick word_start: [:first_name, :last_name, :mtu_id]

  has_many :player_games
  has_many :games, :through => :player_games

  has_many :player_teams
  has_many :teams, :through => :player_teams

  mount_uploader :profile_pic, ImageUploader

  require 'csv'
  require 'active_record'
  require 'activerecord-import'

  def self.residencyimport(file)
    players = []
    CSV.foreach(file.path, headers: true) do |row|
      player_hash = row.to_hash
      players << Player.new(first_name: player_hash["first_name"], last_name: player_hash["last_name"], mtu_id: player_hash["mtu_id"])
    end
    Player.import players
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
