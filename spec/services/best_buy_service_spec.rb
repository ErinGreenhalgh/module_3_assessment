require "rails_helper"

RSpec.describe "best buy service" do
  scenario "gets close stores to a given zipcode"
    VCR.use_cassette("close_stores") do
      key_data = "longName", "city", "distance", "phone", "storeType"

      expect(data["stores"].count).to eq 15
      expect(data["stores"].first.keys).to eq
    end
  end
end
