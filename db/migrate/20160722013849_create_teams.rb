class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string "name", :limit => 75
      t.string "league"
      t.string "conference"
      t.integer "season_id"
      t.boolean "valid_team", :default => false
      t.boolean "valid_name", :default => false
      t.string "team_pic"
      t.integer "wins"
      t.integer "losses"
      t.integer "overtime_losses"
      t.integer "points"
      t.integer "goals_for"
      t.integer "goals against"
      t.timestamps null: false
    end

  end
end
