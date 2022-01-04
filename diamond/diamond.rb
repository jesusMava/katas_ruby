class Diamond
  def self.make_diamond(letter)
    return "A\n"if letter == 'A'

    letters = ('B'..letter).to_a
    around_space = letters.length
    middle_space = 1
    first_line = ' ' * around_space + 'A' + ' ' * around_space + "\n"
    res = first_line
    around_space -= 1

    letters.each do |item|
      spaces = ' ' * around_space
      res +=  spaces + item + ' ' * middle_space + item + spaces + "\n"
      around_space -= 1
      middle_space += 2
    end

    letters.pop
    letters.reverse!
    around_space += 2
    middle_space -= 4

    letters.each do |item|
      spaces = ' ' * around_space
      res +=  spaces + item + ' ' * middle_space + item + spaces + "\n"
      around_space += 1
      middle_space -= 2
    end
    res + first_line
  end
end
