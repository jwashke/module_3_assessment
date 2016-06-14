# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
require "rails_helper"

RSpec.feature "User can view bestbuy stores by zip" do
  it "displays the 15 closest stores and and their information" do
    visit root_path
    fill_in :search, with: "80202"
    click_button "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_selector ".store-name", count: 10
    within("#station-66897") do
      expect(page).to have_content("UDR")
      expect(page).to have_content("800 Acoma St Denver CO 80204")
      expect(page).to have_content("0.3117 miles")
      expect(page).to have_content("Access Times: 24 hours daily")
    end
  end
end
