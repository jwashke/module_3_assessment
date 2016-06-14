require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns a all items as json with a name, description, and image url" do
    item1, item2 = create_list(:item, 2)

    get "/api/v1/items"
    parsed_json - JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_json.count).to eq(2)
    expect(parsed_json.first["name"]).to eq(item1.name)
    expect(parsed_json.first["description"]).to eq(item1.description)
    expect(parsed_json.first["image_url"]).to eq(item1.image_url)
    expect(parsed_json.first["created_at"]).to be(nil)
    expect(parsed_json.first["updated_at"]).to be(nil)
    #
    # expect(response.status).to eq 200
    # expect(parsed_json["id"]).to eq(merchant2.id)
    # expect(parsed_json["name"]).to eq(merchant2.name)
  end
end
# When I send a GET request to /api/v1/items I receive a 200 JSON
# response containing all items And each item has a name, description, and image_url but not the created_at or updated_at
