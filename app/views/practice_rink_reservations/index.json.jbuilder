json.array!(@practice_rink_reservations) do |practice_rink_reservation|
  json.extract! practice_rink_reservation, :id, :team_id, :paid
  json.url practice_rink_reservation_url(practice_rink_reservation, format: :json)
end
