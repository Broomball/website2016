require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  test "should get vistor" do
    get :vistor
    assert_response :success
  end

  test "should get player" do
    get :player
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
