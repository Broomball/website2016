require 'test_helper'

class PlayerGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_game = player_games(:one)
  end

  test "should get index" do
    get player_games_url
    assert_response :success
  end

  test "should get new" do
    get new_player_game_url
    assert_response :success
  end

  test "should create player_game" do
    assert_difference('PlayerGame.count') do
      post player_games_url, params: { player_game: {  } }
    end

    assert_redirected_to player_game_url(PlayerGame.last)
  end

  test "should show player_game" do
    get player_game_url(@player_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_game_url(@player_game)
    assert_response :success
  end

  test "should update player_game" do
    patch player_game_url(@player_game), params: { player_game: {  } }
    assert_redirected_to player_game_url(@player_game)
  end

  test "should destroy player_game" do
    assert_difference('PlayerGame.count', -1) do
      delete player_game_url(@player_game)
    end

    assert_redirected_to player_games_url
  end
end
