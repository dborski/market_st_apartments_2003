class Building

  attr_reader :units
  def initialize
    @units = []
    @renters = []
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
end
