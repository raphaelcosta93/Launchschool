require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test

  attr_reader :car

  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal(4, car.wheels)
  end


  def test_car_exists
    assert(car)
  end

  def test_brand_nil
    assert_nil(car.brand)
  end

  def test_raise_initialize_with_arg
    assert_raises(NoMethodError) do
      car.brand = "Nissan"
    end
  end

  def test_assert_instance_of
    assert_instance_of(Car, car)
  end

  def test_assert_includes
    arr = [1, 2, 3]
    arr << car
    assert_includes(arr, car)
  end

end