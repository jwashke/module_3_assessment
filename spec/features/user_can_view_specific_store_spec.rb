# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"

require "rails_helper"

RSpec.feature "User can view a single best buy store by id" do
  it "displays the store info and hours" do
    visit root_path
    fill_in :search, with: "80202"
    click_button "Search"

    expect(current_path).to eq("/search")
    within("#store-2740") do
      click_link "Best Buy Mobile - Cherry Creek Shopping Center"
    end

    expect(current_path).to eq("/stores/2740")
    within(".store-info") do
      save_and_open_page
      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("3000 East First Ave")
      expect(page).to have_content("Denver, CO 80206")
      expect(page).to have_content("Mon: 10am-9pm")
    end
  end
end

#{ }"hoursAmPm": "Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
