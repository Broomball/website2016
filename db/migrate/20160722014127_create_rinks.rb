class CreateRinks < ActiveRecord::Migration
  def change
    create_table :rinks, :id => false do |t|
      t.integer "season_id"
      t.string "rink_name" #ie. gold, silver, black
      t.string "display_name"  #ie. gold_rink, silver_rink, black_rink
      t.timestamps null: false
    end
    add_index :rinks, ["season_id", "rink_name"]
  end
end
