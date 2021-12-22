class ResistorColorDuo
  COLOR_CATALOG = {
    Black: 0,
    Brown: 1,
    Red: 2,
    Orange: 3,
    Yellow: 4,
    Green: 5,
    Blue: 6,
    Violet: 7,
    Grey: 8,
    White: 9
  }.freeze

  def self.value(colors)
    colors[0,2].map(&:to_sym).map(&:capitalize)
      .map(&COLOR_CATALOG).join('').to_i
  end
end
