class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|

      t.timestamps null: false
    end
  end
end
