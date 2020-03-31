require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test

  def setup
    @renter1 = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Renter, @renter1
  end

  def test_it_has_attributes
    assert_equal "Jessie", @renter1.name
  end
end









# ## Iteration 1
#
# Use TDD to create a Renter class and an Apartment class that respond to the following interaction pattern:

#
# require './lib/apartment'
# # => true
#
# # => #<Renter:0x00007a15c93af80...>
#
# renter1.name
# # => "Jessie"
#
# unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# # => #<Apartment:0x00007fb3ecaae7c0...>
#
# unit1.number
# # => "A1"
#
# unit1.monthly_rent
# # => 1200
#
# unit1.bathrooms
# # => 1
#
# unit1.bedrooms
# # => 1
#
# unit1.renter
# # => nil
#
# unit1.add_renter(renter1)
#
# unit1.renter
# # => #<Renter:0x00007fb3ee106ce8...>
