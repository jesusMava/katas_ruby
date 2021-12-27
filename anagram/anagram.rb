class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    resp = []
    array.each do |el|
      next if el.length != word.length || word.downcase == el.downcase

      resp << el if el.downcase.chars.sort == word.downcase.chars.sort
    end

    resp
  end

  attr_reader :word
end
