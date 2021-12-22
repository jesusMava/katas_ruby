class Complement
  def self.of_dna(dna)
    res = ''

    return res if dna.empty?

    conversion = {
      C: 'G',
      G: 'C',
      T: 'A',
      A: 'U'
    }

    dna.each_char do |letter|
      res += conversion[letter.to_sym] 
    end

    res
  end
end
