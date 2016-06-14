require "rails_helper"

RSpec.feature "User can view a single best buy store by id" do
  it "displays the store info and hours" do
    VCR.use_cassette("Best Buy store show page feature test") do
      visit root_path
      fill_in :search, with: "80202"
      click_button "Search"

      expect(current_path).to eq("/search")
      within("#store-2740") do
        click_link "Best Buy Mobile - Cherry Creek Shopping Center"
      end

      expect(current_path).to eq("/stores/2740")
      within(".store-info") do
        expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
        expect(page).to have_content("3000 East First Ave")
        expect(page).to have_content("Denver, CO 80206")
        expect(page).to have_content("Mon: 10am-9pm")
        expect(page).to have_content("Tue: 10am-9pm")
        expect(page).to have_content("Wed: 10am-9pm")
        expect(page).to have_content("Thurs: 10am-9pm")
        expect(page).to have_content("Fri: 10am-9pm")
        expect(page).to have_content("Sat: 10am-9pm")
        expect(page).to have_content("Sun: 11am-6pm")
      end
    end
  end
end
