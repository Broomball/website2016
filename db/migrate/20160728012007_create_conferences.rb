class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string "league_id"
      t.integer "number"      
      t.timestamps null: false
    end
    add_index :conferences, ["league_id"]
  end
end
