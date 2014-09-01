require 'minitest'
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require_relative '../lib/kaprekar'
require_relative '../lib/kaprekar/num'

class KaprekarTest < Minitest::Test
  def test_backward_sort
    assert 1234.backward_sort, 4321
    assert 4356.backward_sort, 6543
    assert 9980.backward_sort, 9980
    assert 19_567.backward_sort, 97_651
  end

  def test_forward_sort
    assert 4123.forward_sort, 1234
  end

  def test_new_with_input
    kaprekar = Kaprekar.new(1234)
    assert(kaprekar.input, 1234)
  end

  def test_new_without_input 
    kaprekar = Kaprekar.new
    kaprekar.input = 1234
    assert(kaprekar.input, 1234)

  end
end
