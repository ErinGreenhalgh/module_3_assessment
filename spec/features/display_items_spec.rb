require "rails_helper"

RSpec.feature "it displays all items" do
  scenario "on the root page" do
    visit "/"
    expect(page.status_code).to eq 200

    within('h1') do
      expect(page).to have_content("Items")
    end
  end
end
