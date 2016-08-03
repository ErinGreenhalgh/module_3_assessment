require "rails_helper"

RSpec.feature "user searchs for close stores" do
  scenario "by entering zipcode into search form" do
    VCR.use_cassette("close_stores") do
      visit "/"
      fill_in "query", with: "80202"
      click_button "search"

      expect(current_path).to eq search_path
      # Then my current path should be "/search" (ignoring params)
      within("h1") do
        # expect(page).to have_content("17 Total Stores")
        expect(page).to have_content("Total Stores")
      end
      save_and_open_page

      within(".close-stores") do
        expect(page).to have_content("Long Name", "City", "Distance", "Phone Number", "Store Type")
      end

      #How to test for these?
      # And I should see stores within 25 miles of 80202
      # And I should see exactly 15 results
    end
  end
end
