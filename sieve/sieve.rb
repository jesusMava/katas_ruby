require 'prime'

class Sieve
  def initialize(num)
    @num = num
  end

  def primes
    Prime.entries(num)
  end

  private

  attr_reader :num
end
