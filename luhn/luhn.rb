class Luhn
  def self.valid?(digits)
    return false if digits.gsub(/[^\d]/,'').length <= 1
    return false unless digits.scan(/[^\d\s]/).empty?

    digit_serialize = digits.gsub(/\s/,'').chars.each_slice(1).to_a.reverse.join.scan(/\d{0,2}/)
    digit_serialize.pop

    res = digit_serialize.map do |num|
      num.reverse!
      num1 = num[0].to_i
      num2 = num[1].to_i
      doubling =  num1 * 2
      doubling = doubling.digits.sum if doubling > 9
      doubling + num2
    end

    res.map(&:to_i).sum.to_f % 10 == 0.0 ? true : false
  end
end
