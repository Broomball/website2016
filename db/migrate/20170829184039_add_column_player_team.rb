class AddColumnPlayerTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :player_teams, :player_id, :integer
    add_column :player_teams, :team_id, :integer
  end
end
