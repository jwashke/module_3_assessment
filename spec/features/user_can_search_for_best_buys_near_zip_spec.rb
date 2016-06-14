require "rails_helper"

RSpec.feature "User can view bestbuy stores by zip" do
  it "displays the 15 closest stores and and their information" do
    visit root_path
    fill_in :search, with: "80202"
    click_button "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_selector ".store-info", count: 15
    within("#store-2740") do
      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("3.25 miles")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
    end
  end
end
