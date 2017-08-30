class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      t.integer :goals
      t.integer :assists
      t.integer :saves
      t.integer :goals_allowed
      t.integer :penalty_minutes
      t.timestamps
      t.integer :player_id
      t.integer :game_id
    end
  end
end
