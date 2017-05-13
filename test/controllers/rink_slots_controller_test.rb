require 'test_helper'

class RinkSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rink_slot = rink_slots(:one)
  end

  test "should get index" do
    get rink_slots_url
    assert_response :success
  end

  test "should get new" do
    get new_rink_slot_url
    assert_response :success
  end

  test "should create rink_slot" do
    assert_difference('RinkSlot.count') do
      post rink_slots_url, params: { rink_slot: { rink: @rink_slot.rink, slot: @rink_slot.slot } }
    end

    assert_redirected_to rink_slot_url(RinkSlot.last)
  end

  test "should show rink_slot" do
    get rink_slot_url(@rink_slot)
    assert_response :success
  end

  test "should get edit" do
    get edit_rink_slot_url(@rink_slot)
    assert_response :success
  end

  test "should update rink_slot" do
    patch rink_slot_url(@rink_slot), params: { rink_slot: { rink: @rink_slot.rink, slot: @rink_slot.slot } }
    assert_redirected_to rink_slot_url(@rink_slot)
  end

  test "should destroy rink_slot" do
    assert_difference('RinkSlot.count', -1) do
      delete rink_slot_url(@rink_slot)
    end

    assert_redirected_to rink_slots_url
  end
end
