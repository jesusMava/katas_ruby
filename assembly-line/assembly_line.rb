class AssemblyLine
  CARS_PRODUCED_EACH_HOUR = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    case @speed
    when 1..4
      (@speed * CARS_PRODUCED_EACH_HOUR)
    when 5..8
      calculate_card_per_hour(90)
    when 9
      calculate_card_per_hour(80)
    else
      calculate_card_per_hour(77)
    end
  end

  def working_items_per_minute
    minutes = 0.60
    ((production_rate_per_hour / minutes) / 100).to_i
  end

  private

  def calculate_card_per_hour(success_rate)
    ((@speed * CARS_PRODUCED_EACH_HOUR) * success_rate).to_f / 100
  end
end
