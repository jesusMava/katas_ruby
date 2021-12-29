class ResistorColorTrio
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

  def initialize(resistor)
    @resistor = resistor
  end


  def label
    resistor_sym = resistor.map(&:to_sym).map(&:capitalize)

    raise ArgumentError if resistor_sym.map(&COLOR_CATALOG).any?(nil)

    first_value = resistor_sym[0,2].map(&COLOR_CATALOG).join('').to_i
    
    zeros = 10**COLOR_CATALOG[resistor_sym[-1]]
   
    result = first_value * zeros
    transform = result > 1000 ? "#{result/1000} kiloohms" : "#{result} ohms"

    "Resistor value: #{transform}"
  end

  attr_reader :resistor
end
