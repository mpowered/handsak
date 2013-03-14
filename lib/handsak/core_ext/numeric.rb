class Numeric
  # Converts a decimal percentage to number greater than 1. You can also specify the decimal places.
  def to_percentage(decimal_places = 2)
    (self * 100).round_to(decimal_places)
  end

  # Round a number to a specific decimal place.
  def round_to(decimal_places)
    to_f.round(decimal_places)
  end
end
