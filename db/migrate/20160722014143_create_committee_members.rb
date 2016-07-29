class CreateCommitteeMembers < ActiveRecord::Migration
  def change
    create_table :committees, {:id => false} do |t|
      t.string "position"
      t.integer "player_id"
      t.string "committee_email"
      t.datetime "office_hours_start_1"
      t.datetime "office_hours_end_1"
      t.datetime "office_hours_start_2"
      t.datetime "office_hours_end_2"
      t.string "head_of_league" #Name of the league they are head of, null if not a league head
      t.timestamps null: false
    end
  end
end
