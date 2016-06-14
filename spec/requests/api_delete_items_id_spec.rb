require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  it "returns the requested item with its name, description, and image url" do
    item1 = create(:item)

    delete "/api/v1/items/#{item1.id}", format: :json

    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
  end
end
