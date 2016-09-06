class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :invoice_id
      t.decimal :amount_paid, :precision => 8, :scale => 2
      t.boolean :late
      t.datetime :due_date
      t.string :team_id
      t.string :player_id

      t.timestamps null: false
    end
  end
end
