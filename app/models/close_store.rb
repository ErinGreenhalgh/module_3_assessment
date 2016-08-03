class CloseStore
  attr_reader :long_name, :city, :distance, :phone, :store_type

  def initialize(data)
    @long_name  = data["longName"]
    @city       = data["city"]
    @distance   = data["distance"]
    @phone      = data["phone"]
    @store_type = data["storeType"]
  end

  def self.service
    @@service = BestBuyService.new
  end

  def self.all(zipcode)
    raw_data = service.close_stores(zipcode)
    raw_data["stores"].map do |store_data|
      CloseStore.new(store_data)
    end
  end

  def self.total(zipcode)
    raw_data = service.close_stores(zipcode)
    raw_data["total"]
  end

end
