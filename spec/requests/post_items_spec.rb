# When I send a POST request to /api/v1/items with a name, description, and image_url
# I receive a 201 JSON response if the record is successfully created And
# I receive a JSON response containing the name, description, and image_url but not the created_at or updated_at
require "rails_helper"

RSpec.describe "POST /api/v1/items" do
  it "returns the created item with its name, description, and image url" do
    post "/api/v1/items", format: :json, name: "item name", description: "item description", image_url: "item image url"
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(parsed_json["name"]).to eq("item name")
    expect(parsed_json["description"]).to eq("item description")
    expect(parsed_json["image_url"]).to eq("item image url")
    expect(parsed_json["created_at"]).to be(nil)
    expect(parsed_json["updated_at"]).to be(nil)
  end
end
