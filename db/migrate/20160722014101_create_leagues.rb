class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues, {:id => false} do |t|
      t.string "league"
      t.string "full_league_name"
      t.integer "season_id"
      t.timestamps null: false
    end
  end
end
