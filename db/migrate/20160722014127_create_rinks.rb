class CreateRinks < ActiveRecord::Migration
  def change
    create_table :rinks do |t|

      t.timestamps null: false
    end
  end
end
