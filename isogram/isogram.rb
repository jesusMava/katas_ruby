class Isogram
  def self.isogram?(phrase)
    phrase_to_string = phrase.gsub(/[^\w]/, '').downcase.chars
    phrase_to_string == phrase_to_string.uniq
  end
end
