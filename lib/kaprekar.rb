require_relative 'kaprekar/num'
require_relative 'kaprekar/errors'

# Class for exploring Kaprekar's constant.
class Kaprekar
  attr_accessor :input
  attr_reader :result, :iterations
  alias_method :count, :iterations

  def initialize(input = nil)
    return self if input.nil?
    @input = input
  end

  def calculate(input = nil)
    @input = input unless input.nil?
    sanitize_input
    fail InvalidInput unless valid_input?
    kaprekar
    @result = { input: @input,
                iterations: @iterations,
                intermediaries: @intermediaries }
  end
  alias_method :run, :calculate
  alias_method :start, :calculate

  def pretty
    calculate
    puts "Input: #{@input}"
    puts "Total iterations to 6174: #{@iterations}"
    @result[:intermediaries].each do |int|
      puts "Number: #{int[:num]}, Count: #{int[:count]}"
    end
    nil
  end
  alias_method :pp, :pretty

  def valid_input?(input = nil)
    @input = input unless input.nil?
    return false if @input.to_i.zero?
    return false if @input.nil?
    return false unless @input.to_s.split('').count == 4
    return false unless @input.to_s.split('').uniq.join == @input.to_s
    true
  end
  alias_method :valid?, :valid_input?

  private

  def sanitize_input
    @input = @input.to_i if @input.is_a? String
  end

  def kaprekar
    input = @input
    @iterations, result = 0, 0
    @intermediaries  = [{ num: @input, count: iterations }]
    until result == 6174
      result = input.backward_sort - input.forward_sort
      input = result
      @iterations += 1
      @intermediaries << { num: result, count: @iterations }
    end
  end
end

