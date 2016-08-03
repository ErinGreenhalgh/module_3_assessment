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

  scenario "gets a single item" do
    item = items(:pizza)
    get "/api/v1/items/#{item.id}"

    assert_response :success
    data = JSON.parse(response.body)

    expect(data["name"]).to eq item.name
    expect(data["description"]).to eq item.description
    expect(data["image_url"]).to eq item.image_url
  end

  scenario "it deletes an item" do
    item = items(:pizza)
    delete "/api/v1/items/#{item.id}"

    expect(response).to have_http_status(204)
    expect { Item.find(item.id) }.to raise_error ActiveRecord::RecordNotFound
  end


end
