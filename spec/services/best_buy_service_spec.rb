require "rails_helper"

RSpec.describe "best buy service" do
  scenario "gets close stores to a given zipcode" do
    VCR.use_cassette("close_stores") do
      store_data = "longName", "city", "distance", "phone", "storeType"
      service = BestBuyService.new
      data = service.close_stores("80202")
      expect(data["stores"].count).to eq 15
      expect(data["stores"].first.keys).to eq store_data
    end
  end
end
