class IsbnVerifier 
  #v2
  VALID_ISBN_FORMAT = /^\d{9}[\dX]$/

  def self.valid?(string)
    string = string.delete('-')
    return false unless string[VALID_ISBN_FORMAT]

    sum = string
      .chars
      .map { |c| c == 'X' ? 10 : c.to_i }
      .map.with_index { |n, i| n * (10 - i) }
      .reduce(&:+)

    sum % 11 == 0
  end
end
