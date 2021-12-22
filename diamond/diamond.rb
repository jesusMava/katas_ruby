class Diamond
  def self.make_diamond(letter)
    return "A\n"if letter == 'A'
    my_instance = Diamond.new
    array_of_letters = my_instance.range_of_letters(letter)
    total_spaces = array_of_letters.length
    num_of_spaces_around = total_spaces - 2
    medium_spaces = 1
    first_letter = array_of_letters.shift
    last_letter = array_of_letters.pop
    first_and_last_line = ' ' * (total_spaces-1) + first_letter + ' ' * (total_spaces - 1) + "\n"
    medium_line = last_letter + ' ' * total_spaces  + last_letter + "\n"
    # array_of_letters.shift
    diamond = ''

    array_of_letters.each do |chart|
      diamond += ' ' * num_of_spaces_around + chart + ' ' * medium_spaces + chart + ' ' * num_of_spaces_around + "\n"
      num_of_spaces_around -= 1
      medium_spaces += 2
    end
    down_part = diamond.split("\n").reverse.join("\n")

    first_and_last_line + diamond + medium_line + down_part + "\n" + first_and_last_line
    # down_part = my_instance.down_part_diamond(array_of_letters, total_spaces)

    # first_and_last_line + diamond + down_part + first_and_last_line
  end

#   def down_part_diamond(array_of_letters, medium_spaces)
#     array_of_letters_reverse = array_of_letters.reverse
#     array_of_letters_reverse.shift
#     num_of_spaces_around = 1 
#     medium_spaces_letter = medium_spaces
#     diamond = ''
#     array_of_letters_reverse.each do |chart|
#       diamond += ' ' * num_of_spaces_around + chart + ' ' * medium_spaces + chart + ' ' * num_of_spaces_around + "\n"
#       num_of_spaces_around += 1
#       medium_spaces -= 2
#       medium_spaces = 0 unless medium_spaces.positive?
#     end

#     diamond
#   end


  def num_of_spaces(array_of_letters)
    letter_count = array_of_letters.length
    horizontally_space = letter_count
  end

  def range_of_letters(letter)
    ('A'..letter).to_a
  end
end
