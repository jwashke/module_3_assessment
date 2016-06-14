# When I send a DELETE request to /api/v1/items/1
# I receive a 204 JSON response if the record is successfully deleted
require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  it "returns the requested item with its name, description, and image url" do
    item1 = create(:item)
    delete "/api/v1/items/#{item1.id}", format: :json
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq(204)
    expect(parsed_json["name"]).to eq(item1.name)
    expect(parsed_json["description"]).to eq(item1.description)
    expect(parsed_json["image_url"]).to eq(item1.image_url)
    expect(Item.count).to eq(0)
  end
end
