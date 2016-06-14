require 'rails_helper'

RSpec.describe BestBuyService do
  describe "#search_by_zip" do
    it "returns a parsed results hash with 15 stores by zip and distance" do
      VCR.use_cassette("#search_by_zip") do
        response = BestBuyService.new.search_by_zip("80202", "25")

        expect(response["stores"].count).to eq(15)
        expect(response["total"]).to eq(17)
      end
    end
  end

  describe "#search_by_store_id" do
    it "returns a single store by store id" do
      VCR.use_cassette("#search_by_store_id") do
        
      end
    end
  end
end
