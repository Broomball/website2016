class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string "mtu_id", :limit => 15
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "full_name", :limit => 50
      t.string "nickname", :limit => 40
      t.string "email", :limit => 40
      t.string "profile_pic_path", :default => "/assets/default_pic.png"
      t.string "major", :limit => 30
      t.string "hometown", :limit => 30
      t.string "position", :limit => 30
      t.integer "height_feet"
      t.integer "height_inches"
      t.integer "weight"
      t.integer "years_played"
      t.text "description", :limit => 250
      t.timestamps null: false
    end
    add_index("players", "full_name")
  end
end
