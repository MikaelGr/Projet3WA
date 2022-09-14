require "application_system_test_case"

class BoostersTest < ApplicationSystemTestCase
  setup do
    @booster = boosters(:one)
  end

  test "visiting the index" do
    visit boosters_url
    assert_selector "h1", text: "Boosters"
  end

  test "creating a Booster" do
    visit boosters_url
    click_on "New Booster"

    fill_in "Name", with: @booster.name
    fill_in "Price", with: @booster.price
    click_on "Create Booster"

    assert_text "Booster was successfully created"
    click_on "Back"
  end

  test "updating a Booster" do
    visit boosters_url
    click_on "Edit", match: :first

    fill_in "Name", with: @booster.name
    fill_in "Price", with: @booster.price
    click_on "Update Booster"

    assert_text "Booster was successfully updated"
    click_on "Back"
  end

  test "destroying a Booster" do
    visit boosters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booster was successfully destroyed"
  end
end
