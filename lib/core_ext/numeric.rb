class Numeric
  # Converts a decimal percentage to number greater than 1. You can also specify the decimal places.
  def to_percentage(decimal_places = 2)
    (self * 100).round_to(decimal_places)
  end

  # Round a number to a specific decimal place.
  def round_to(decimal_places)
    x = self
    decimal_places.times do
      x = x * 10
    end
    x = x.round
    decimal_places.times do
      x = x.to_f / 10
    end
    x
  end
end
