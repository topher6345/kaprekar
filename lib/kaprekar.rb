require_relative './kaprekar/num'
# Class for exploring Kaprekar's constant.
class Kaprekar
  attr_accessor :input
  attr_reader :reult, :iterations

  def initialize(input = nil)
    return self if input.nil?
    @input = input
  end

  def calculate(input = nil)
    @input = input unless input.nil?
    # fail InvalidInputError unless valid_input?(input)
    @result = { input: @input }
    @iterations = 0
    @result = 0
    until @result == 6174
      @result = @input.backward_sort.to_i - @input.forward_sort.to_i
      input = @result
      @iterations += 1
    end
  end

  private

  def sanitize_input(input)
    input.to_i if input.is_a? String
  end

  def valid_input?(input = nil)
    return false unless input.to_s.split('').count == 4
    true
  end

end
