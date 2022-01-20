module Atbash
  LETTERS = ('a'..'z').to_a
  LETTERS_REVERSE = LETTERS.reverse
  def self.encode(text)
    res = ''
    text.gsub!(/[^\w]/,'')
    text_conver = text.downcase.scan(/\w{1,5}/).join(' ')
    text_conver.chars do |el|
      if LETTERS.index(el)
        res << LETTERS_REVERSE[LETTERS.index(el)]
      else
        res << el
      end
    end

    res
  end

  def self.decode(text)
    res = ''
    text.gsub!(/[^\w]/,'')
    text_conver = text.downcase
    text_conver.chars do |el|
      if LETTERS.index(el)
        res << LETTERS[LETTERS_REVERSE.index(el)]
      else
        res << el
      end
    end

    res
  end
end
