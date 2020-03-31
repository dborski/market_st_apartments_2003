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
    @units.each do |unit|
      if unit.renter != nil
        @renters << unit.renter.name
      end
    end
    @renters
  end

  def average_rent
    sum = @units.sum {|unit|unit.monthly_rent}
    sum / @units.length.to_f
  end

  def rented_units
    @units.each {|unit| @rented_units << unit if unit.renter != nil}
    @rented_units
  end

  def highest_rent
    rented_units.max_by do |unit|
     unit.monthly_rent
   end
  end

  def renter_with_highest_rent
    highest_rent.renter
  end

  def units_by_number_of_bedrooms
    units.group_by do |unit|
      unit.bedrooms
    end 
  end
end
