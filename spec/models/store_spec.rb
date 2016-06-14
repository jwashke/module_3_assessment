require 'rails_helper'

RSpec.describe Store do
  describe ".get_stores" do
    it "returns an array with total number of stores and an array of 15 stores" do
      VCR.use_cassette(".get_stores model") do
        response = Store.get_stores("80202")
        total = response.first
        stores = response.last

        expect(total).to eq(17)
        expect(stores.count).to eq(15)
        expect(stores.first.name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      end
    end
  end

  describe ".get_store" do
    it "returns a single store with an hours array" do
      VCR.use_cassette(".get_store model") do
        store = Store.get_store("2740")

        expect(store.name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
        expect(store.hours.first).to eq("Mon: 10am-9pm")
      end
    end
  end

  describe "#format_store_hours" do
    it "splits a string of hours by a space and a \; into an array" do
      store = {}
      string = "Mon: 10am-9pm\; Tues: 10am-9pm"
      array = Store.new(store).format_store_hours(string)
      expect(array.count).to eq(2)
      expect(array.first).to eq("Mon: 10am-9pm")
    end
  end
end

class Store
  public :format_store_hours
end
