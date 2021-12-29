class Phrase
  attr_reader :words

  def initialize(words)
    @words = words.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
     words.group_by(&:itself).transform_values(&:count)
    end
end
