class RotationalCipher

  UPPER = ('A'..'Z').to_a.freeze
  LOWER = ('a'..'z').to_a.freeze
  def self.rotate(input, n)
    input.tr((UPPER + LOWER).join, (UPPER.rotate(n) + LOWER.rotate(n)).join)
  end
end
