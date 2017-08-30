#json.array! @games, partial: 'games/game', as: :game
json.array! @games do |game|
  json.title game.id
  json.start game.start_time
  json.end game.end_time
  json.color game.rink
end
