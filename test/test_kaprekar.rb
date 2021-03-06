require 'minitest'
require 'minitest/autorun'
require_relative '../lib/kaprekar'
# Tests for Kaprekar Gem
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

  def test_valid_input
    kaprekar = Kaprekar.new('asdf')
    assert_equal(false, kaprekar.valid_input?)

    assert_raises InvalidInput do
      Kaprekar.new('asdf').calculate
    end

    assert_equal false, Kaprekar.new(1123).valid_input?
  end

  def test_kaprekar
    assert_equal(
      Kaprekar.new(1234).calculate,
      input: 1234,
      iterations: 3,
      intermediaries: [{ num: 1234, count: 0 },
                       { num: 3087, count: 1 },
                       { num: 8352, count: 2 },
                       { num: 6174, count: 3 }])
  end

end
