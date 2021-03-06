class Building

  attr_reader :units
  def initialize
    @units = []
    @renters = []
    @rented_units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    renter_names = []
    units.each do |unit|
      if unit.renter != nil
        renter_names << unit.renter.name
      end
    end
    @renters = renter_names
  end

  def average_rent
    sum = @units.sum {|unit|unit.monthly_rent}
    sum / @units.length.to_f
  end

  def rented_units
    rented_units = @units.find_all do |unit|
      !unit.renter.nil?
    end
    rented_units
  end

  def highest_rent
    rented_units.max_by do |unit|
     unit.monthly_rent
   end
  end

  def renter_with_highest_rent
    highest_rent.renter
  end

  def sorted_units
    units.group_by {|unit| unit.bedrooms}
  end

  def units_by_number_of_bedrooms
    sorted_hash = {}
    sorted_units.map do |key, value|
      sorted_hash[key] = value.map {|value| value.number}.flatten
    end
    sorted_hash
  end

  def annual_breakdown
    annual_breakdown = {}
    rented_units.each do |unit|
      annual_breakdown[unit.renter.name] = unit.monthly_rent * 12
    end
    annual_breakdown
  end

  def rooms_by_renter
    rooms_by_renter = {}
    rented_units.each do |unit|
      rooms_by_renter[unit.renter] = {bathrooms: unit.bathrooms, bedrooms: unit.bedrooms}
    end
    rooms_by_renter
  end
end
