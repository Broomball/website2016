class CreateRinkSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :rink_slots do |t|
      t.string :rink
      t.datetime :slot

      t.timestamps
    end
  end
end
