class Store
  attr_reader :name, :city, :distance, :phone, :store_type, :id

  def initialize(store)
    @id = store["storeId"]
    @name = store["longName"]
    @phone = store["phone"]
    @store_type = store["storeType"]
    @city = store["city"]
    @distance = store["distance"]
  end

  def self.get_stores(zip_code, distance = 25)
    response = BestBuyService.new.search_by_zip(zip_code, distance)
    total = response["total"]
    stores = response["stores"].map do |store|
      Store.new(store)
    end
    [total, stores]
  end
end
