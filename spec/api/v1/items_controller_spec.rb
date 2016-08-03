require "rails_helper"

RSpec.describe "api::v1::items_controller" do
  fixtures :items
  scenario "gets all items" do
    item1 = items(:pizza)
    item2 = items(:calzone)

    get "/api/v1/items"

    assert_response :success
    data = JSON.parse(response.body)

    expect(data.count).to eq 2
    expect(data.first.keys).to eq ["name", "description", "image_url"]
  end

end
