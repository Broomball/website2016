class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :mtu_id, limit: 20
      t.string :first_name
      t.string :last_name
      t.string :nickname, limit: 60
      t.string :profile_pic
      t.string :major, limit: 50
      t.string :hometown, limit: 50
      t.string :position, limit: 30
      t.integer :height_feet
      t.integer :height_inches
      t.integer :age
      t.integer :years_played
      t.text :description
      t.boolean :committee

      t.timestamps
    end
  end
end
