class Swatch
  SPOT_COLORS = [
    "725AC1",
    "8D86C9",
    "FE5F55",
    "F4ACB7",
    "A39171",
    "C200FB",
    "EC7D10",
    "FFBC0A",
    "3185FC",
    "F9DC5C",
    "5FAD56",
    "009FB7",
    "FED766",
    "81F495"
  ]

  attr_reader :light, :dark

  def initialize
    @light = SPOT_COLORS.sample
    @dark = "222222"
  end
end
