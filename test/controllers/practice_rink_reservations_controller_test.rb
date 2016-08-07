require 'test_helper'

class PracticeRinkReservationsControllerTest < ActionController::TestCase
  setup do
    @practice_rink_reservation = practice_rink_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_rink_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_rink_reservation" do
    assert_difference('PracticeRinkReservation.count') do
      post :create, practice_rink_reservation: { paid: @practice_rink_reservation.paid, team_id: @practice_rink_reservation.team_id }
    end

    assert_redirected_to practice_rink_reservation_path(assigns(:practice_rink_reservation))
  end

  test "should show practice_rink_reservation" do
    get :show, id: @practice_rink_reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @practice_rink_reservation
    assert_response :success
  end

  test "should update practice_rink_reservation" do
    patch :update, id: @practice_rink_reservation, practice_rink_reservation: { paid: @practice_rink_reservation.paid, team_id: @practice_rink_reservation.team_id }
    assert_redirected_to practice_rink_reservation_path(assigns(:practice_rink_reservation))
  end

  test "should destroy practice_rink_reservation" do
    assert_difference('PracticeRinkReservation.count', -1) do
      delete :destroy, id: @practice_rink_reservation
    end

    assert_redirected_to practice_rink_reservations_path
  end
end
