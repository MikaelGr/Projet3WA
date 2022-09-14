require 'test_helper'

class BoostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booster = boosters(:one)
  end

  test "should get index" do
    get boosters_url
    assert_response :success
  end

  test "should get new" do
    get new_booster_url
    assert_response :success
  end

  test "should create booster" do
    assert_difference('Booster.count') do
      post boosters_url, params: { booster: { name: @booster.name, price: @booster.price } }
    end

    assert_redirected_to booster_url(Booster.last)
  end

  test "should show booster" do
    get booster_url(@booster)
    assert_response :success
  end

  test "should get edit" do
    get edit_booster_url(@booster)
    assert_response :success
  end

  test "should update booster" do
    patch booster_url(@booster), params: { booster: { name: @booster.name, price: @booster.price } }
    assert_redirected_to booster_url(@booster)
  end

  test "should destroy booster" do
    assert_difference('Booster.count', -1) do
      delete booster_url(@booster)
    end

    assert_redirected_to boosters_url
  end
end
