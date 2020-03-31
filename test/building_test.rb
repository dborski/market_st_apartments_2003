require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_can_add_units_to_building
    assert_equal [], @building.units

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal [@unit1, @unit2], @building.units
  end

  def test_can_add_renter_to_apartment
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    @unit1.add_renter(@renter1)
    @unit2.add_renter(@renter2)

    assert_equal ["Aurora", "Tim"], @building.renters

  end
end




# ## Iteration 2
#
# Use TDD to create a Building class that responds to the following interaction pattern.

# building.renters
# # => []
#
#
# building.renters
# # => ["Aurora"]
#
#
# unit2.add_renter(renter2)
#
# building.renters
# # => ["Aurora", "Tim"]
#
# building.average_rent
# # => 1099.5
