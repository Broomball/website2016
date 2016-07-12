require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get allteams" do
    get :allteams
    assert_response :success
  end

  test "should get userteam" do
    get :userteam
    assert_response :success
  end

end
