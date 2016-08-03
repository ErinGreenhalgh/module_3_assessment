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

  scenario "it creates an item" do
    item_params = {"name" => "New Item", "description" => "so great", "image_url" => "www.exmaple.com"}
    expect(Item.count).to eq 2

    post "/api/v1/items", params: {item: item_params}

    data = JSON.parse(response.body)

    expect(Item.count).to eq 3
    expect(response).to have_http_status(201)
    expect(data["name"]).to eq "New Item"
    expect(data["description"]).to eq "so great"
    expect(data["image_url"]).to eq "www.example.com"
  end


end
