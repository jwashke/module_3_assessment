class Store
  attr_reader :name, :city, :distance, :phone, :store_type,
              :id, :hours, :address, :state, :zip

  def initialize(store)
    @id = store["storeId"]
    @name = store["longName"]
    @phone = store["phone"]
    @store_type = store["storeType"]
    @address = store["address"]
    @city = store["city"]
    @state = store["region"]
    @zip = store["postalCode"]
    @distance = store["distance"]
    @hours = format_store_hours(store["hoursAmPm"]) if store["hoursAmPm"]
  end

  def self.get_stores(zip_code, distance = 25)
    response = BestBuyService.new.search_by_zip(zip_code, distance)
    total = response["total"]
    stores = response["stores"].map do |store|
      Store.new(store)
    end
    [total, stores]
  end

  def self.get_store(store_id)
    response = BestBuyService.new.search_by_store_id(store_id)
    store = response["stores"].first
    Store.new(store)
  end

  private

  def format_store_hours(hours_string)
    hours_string.split("\; ")
  end
end
