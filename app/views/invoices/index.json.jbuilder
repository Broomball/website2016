json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :id, :amount_paid, :amount_paid, :late, :due_date, :team_id, :player_id
  json.url invoice_url(invoice, format: :json)
end
