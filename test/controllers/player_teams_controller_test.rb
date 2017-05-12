require 'test_helper'

class PlayerTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_team = player_teams(:one)
  end

  test "should get index" do
    get player_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_player_team_url
    assert_response :success
  end

  test "should create player_team" do
    assert_difference('PlayerTeam.count') do
      post player_teams_url, params: { player_team: {  } }
    end

    assert_redirected_to player_team_url(PlayerTeam.last)
  end

  test "should show player_team" do
    get player_team_url(@player_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_team_url(@player_team)
    assert_response :success
  end

  test "should update player_team" do
    patch player_team_url(@player_team), params: { player_team: {  } }
    assert_redirected_to player_team_url(@player_team)
  end

  test "should destroy player_team" do
    assert_difference('PlayerTeam.count', -1) do
      delete player_team_url(@player_team)
    end

    assert_redirected_to player_teams_url
  end
end
