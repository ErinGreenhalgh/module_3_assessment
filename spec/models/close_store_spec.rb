require "rails_helper"

RSpec.describe "close store" do
  scenario "creates an aray of close store objects from API data" do
    VCR.use_cassette("close_stores") do

      zipcode = "80202"
      expect(CloseStore.all(zipcode).count).to eq 15
      store = CloseStore.all(zipcode).first
      expect(store.long_name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(store.city).to eq("Denver")
      expect(store.distance).to eq(3.25)
      expect(store.phone).to eq("303-270-9189")
      expect(store.store_type).to eq("Mobile")
      expect(store.id).to eq 2740
    end
  end

  scenario "gets a single store" do
    VCR.use_cassette("single_store") do
      id = 2740
      store = CloseStore.find(id)
      expect(store.id).to eq 2740
      expect(store.name).to eq "Cherry Creek Shopping Center" 
    end
  end


end
