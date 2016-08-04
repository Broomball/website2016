class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string "name", :limit => 75
      t.string "league"
      t.string "conference"
      t.integer "captain_id"
      t.integer "season_id"
      t.boolean "valid_team"
      t.string "team_pic_path", :default => "/assets/default_pic.png"
      t.integer "wins"
      t.integer "losses"
      t.integer "overtime_losses"
      t.integer "points"
      t.integer "goals_for"
      t.integer "goals against"
      t.integer "conference_rank"
      t.timestamps null: false
    end
    
    add_index :teams, ["name", "league", "conference"]
  end
end
