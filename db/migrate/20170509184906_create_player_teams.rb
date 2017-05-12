class CreatePlayerTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :player_teams do |t|
      t.boolean :captain
      t.timestamps
    end
  end
end
