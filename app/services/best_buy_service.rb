class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/stores")
  end
# https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=15&apiKey=nysued5unnmfhft4bp5u6779
  def search_by_zip(zip_code, distance)
    parse_json(search_nearest(zip_code, distance))
  end

  def search_nearest(zip_code, distance)
    @conn.get "(area(#{zip_code},#{distance}))?format=json&show=storeId,storeType,name&pageSize=15&apiKey=nysued5unnmfhft4bp5u6779", {
      show: "storeId,longName,phone,city,distance,storeType",
      apiKey: ENV['BEST_BUY_API_KEY'],
      pageSize: "15",
    }
  end

  def parse_json(response)
    JSON.parse(response.body)
  end
end
