class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      t.integer :goals
      t.integer :assists
      t.integer :save
      t.integer :goals_allowed
      t.integer :penalty_minutes

      t.timestamps
    end
  end
end
