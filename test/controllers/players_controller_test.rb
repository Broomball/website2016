require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  test "should get listPlayers" do
    get :listPlayers
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get stats" do
    get :stats
    assert_response :success
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

end
