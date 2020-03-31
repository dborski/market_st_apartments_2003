class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms
  def initialize(init_hash)
    @number = init_hash[:number]
    @monthly_rent = init_hash[:monthly_rent]
    @bathrooms = init_hash[:bathrooms]
    @bedrooms = init_hash[:bedrooms]
  end
end
