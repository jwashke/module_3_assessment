require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns a all items as json with a name, description, and image url" do
    item1, item2 = create_list(:item, 2)
    get "/api/v1/items", format: :json
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_json.count).to eq(2)
    expect(parsed_json.first["name"]).to eq(item1.name)
    expect(parsed_json.first["description"]).to eq(item1.description)
    expect(parsed_json.first["image_url"]).to eq(item1.image_url)
    expect(parsed_json.first["created_at"]).to be(nil)
    expect(parsed_json.first["updated_at"]).to be(nil)
  end
end
