class CreatePracticeRinkReservations < ActiveRecord::Migration
  def change
    create_table :practice_rink_reservations do |t|
      t.string :team_id
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
