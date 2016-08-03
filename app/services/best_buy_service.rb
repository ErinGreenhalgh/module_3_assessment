class BestBuyService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def close_stores(zipcode)
    _connecion.params = {"format" => "json",
                         "apiKey" => ENV["api_key"],
                         "show" => "longName,city,distance,phone,storeType"}
    response = _connection.get("/v1/stores(area(#{zipcode},25))")
    JSON.parse(response.body)
  end


  private
  def _connection
    @_connection
  end

end
