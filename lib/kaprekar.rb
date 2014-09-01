require_relative './kaprekar/num'
require_relative './kaprekar/errors'

# Class for exploring Kaprekar's constant.
class Kaprekar
  attr_accessor :input
  attr_reader :result, :iterations

  def initialize(input = nil)
    return self if input.nil?
    @input = input
  end

  def calculate(input = nil)
    @input = input unless input.nil?
    fail InvalidInput unless valid_input?
    @result = { input: @input }
    iterations = 0
    result = 0
    input = @input
    until result == 6174
      result = input.backward_sort - input.forward_sort
      puts result
      input = result
      iterations += 1
    end
    @result = { input: @input, iterations: iterations }
  end

  def valid_input?(input = nil)
    @input = input unless input.nil?
    return false if @input.to_i.zero?
    return false if @input.nil?
    return false unless @input.to_s.split('').count == 4
    true
  end

  private

  def sanitize_input(input)
    input.to_i if input.is_a? String
  end
end
