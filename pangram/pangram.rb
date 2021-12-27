require 'set'
class Pangram
  def self.pangram?(sentence)
    str = sentence.downcase
    ("a".."z").all? { |char| str.include?(char) }
  end
end
