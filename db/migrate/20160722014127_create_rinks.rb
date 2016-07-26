class CreateRinks < ActiveRecord::Migration
  def change
    create_table :rinks do |t|
      t.integer "season_id"
      t.string "rink_name"
      t.string "display_name"  
      t.timestamps null: false
    end
  end
end
