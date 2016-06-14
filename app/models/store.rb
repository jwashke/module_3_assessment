class Store
  attr_reader :long_name, :city, :distance, :phone_number, :store_type

  def initialize(store)
    byebug
  end

  def self.get_store(zip_code, distance = 25)
    response = BestBuyService.new.search_by_zip(zip_code, distance)
    total = response["total"]
    stores = response["stores"].map do |store|
      Store.new(store)
    end
    [total, stores]
  end
end
