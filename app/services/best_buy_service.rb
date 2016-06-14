class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1")
  end
#https://api.bestbuy.com/v1/stores(storeId=2740)?format=json&show=long_name,storeType,address,city,region,postalCode,hoursAmPm&apiKey=nysued5unnmfhft4bp5u6779
  def search_by_zip(zip_code, distance)
    parse_json(search_nearest(zip_code, distance))
  end

  def search_by_store_id(store_id)
    parse_json(stores_by_id(store_id))
  end

  def stores_by_id(store_id)
    @conn.get "stores(storeId=#{store_id})", {
      format: "json",
      show: "longName,storeType,address,city,region,postalCode,hoursAmPm",
      apiKey: ENV['BEST_BUY_API_KEY']
    }
  end

  def search_nearest(zip_code, distance)
    @conn.get "stores(area(#{zip_code},#{distance}))", {
      format: "json",
      show: "storeId,longName,phone,city,distance,storeType",
      apiKey: ENV['BEST_BUY_API_KEY'],
      pageSize: "15"
    }
  end

  def parse_json(response)
    JSON.parse(response.body)
  end
end
