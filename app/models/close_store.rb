class CloseStore
  attr_reader :id, :long_name, :city, :distance, :phone, :store_type,
              :name, :address, :city, :state, :zipcode

  def initialize(data)
    @long_name  = data["longName"]
    @city       = data["city"]
    @distance   = data["distance"]
    @phone      = data["phone"]
    @store_type = data["storeType"]
    @id         = data["storeId"]
    @name       = data["name"]
    @address    = data["address"]
    @city       = data["city"]
    @state      = data["region"]
    @zipcode    = data["postalCode"]
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

  def self.find(id)
    raw_data = service.single_store(id)
    CloseStore.new(raw_data)
  end

  def self.total(zipcode)
    raw_data = service.close_stores(zipcode)
    raw_data["total"]
  end

end
