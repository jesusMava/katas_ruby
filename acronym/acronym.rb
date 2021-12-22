class Acronym
  def self.abbreviate(word)
    word.gsub(/[^\w\s]/, ' ').split(' ').map{ |word| word[0] }.join('').upcase
  end
end
