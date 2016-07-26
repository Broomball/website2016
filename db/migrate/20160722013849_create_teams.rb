class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string "name", :limit => 40
      t.string "league"
      t.string "conference"
      t.integer "captain_id"
      t.string "team_pic_path", :default => "/assets/default_pic.png"
      t.timestamps null: false
    end
  end
end
