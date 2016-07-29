class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues, {:id => false} do |t|
      t.integer "season_id"
      t.string "league"
      t.string "league_head_name"
      t.string "league_head_email"
      t.string "full_league_name"
      t.string "preferred_rink"
      t.timestamps null: false
    end
    add_index :leagues, ["league"]
  end
end
