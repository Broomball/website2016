class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string "home_team_id"
      t.string "away_team_id"
      t.string "home_goals"
      t.string "away_goals"
      t.string "overtime_loss"
      t.datetime "start_time"
      t.datetime "end_time"
      t.string "rink"
      t.string "video_url"
      t.timestamps null: false
    end
  end
end
