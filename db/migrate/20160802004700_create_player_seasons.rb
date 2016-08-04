class CreatePlayerSeasons < ActiveRecord::Migration
  def change
    create_table :player_seasons do |t|
      t.references :players
      t.integer "season_id"  
      t.boolean "attended_captains_meeting"
      t.string "residency_league"
      t.timestamps null: false
    end
  end
end
