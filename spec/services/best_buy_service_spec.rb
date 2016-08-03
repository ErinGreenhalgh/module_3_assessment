require "rails_helper"

RSpec.describe "best buy service" do
  scenario "gets close stores to a given zipcode" do
    VCR.use_cassette("close_stores") do
      store_data = "longName", "city", "distance", "phone", "storeType", "storeId"
      service = BestBuyService.new
      data = service.close_stores("80202")
      expect(data["stores"].count).to eq 15
      expect(data["stores"].first.keys).to eq store_data
    end
  end

  scenario "gets a single store" do
    VCR.use_cassette("single_store") do
      service = BestBuyService.new
      id = 2740
      data = service.single_store(id)
      expect(data["address"]). to eq "3000 East First Ave"
      expect(data["storeId"]).to eq 2740
    end
  end
end
