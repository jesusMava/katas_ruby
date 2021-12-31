class Proverb 
  def initialize(*arg, **key)
    @words = arg
    @key = key
  end

  def to_s
    index = 0
    resp = ''
    while index < words.length - 1
      resp += "For want of a #{words[index]} the #{words[index + 1]} was lost.\n"
      index += 1
    end
    
    last_phrase = key.empty? ? '' : " #{key[:qualifier]}" 
    resp += "And all for the want of a#{last_phrase} #{words[0]}."
  end

  private

  attr_reader :words, :key
end
