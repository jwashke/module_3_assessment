require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  it "returns the requested item with its name, description, and image url" do
    item1, item2 = create_list(:item, 2)
    get "/api/v1/items/#{item1.id}", format: :json
    parsed_json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_json["name"]).to eq(item1.name)
    expect(parsed_json["description"]).to eq(item1.description)
    expect(parsed_json["image_url"]).to eq(item1.image_url)
    expect(parsed_json["created_at"]).to be(nil)
    expect(parsed_json["updated_at"]).to be(nil)
  end
end
