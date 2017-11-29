class Rule
  INTERESTING_RULES = [
    9,
    18,
    22,
    25,
    26,
    27,
    30,
    33,
    35,
    37,
    38,
    41,
    45,
    54,
    56,
    60,
    73,
    90,
    94,
    105,
    106,
    110,
    122,
    126,
    146,
    150,
    154,
    170,
    184
  ]

  STATES = [
    "111",
    "110",
    "101",
    "100",
    "010",
    "011",
    "001",
    "000"
  ]

  attr_reader :id

  def initialize
    @id = INTERESTING_RULES.sample
  end

  def to_binary_list
    binary_rules = @id.to_s(2).split("")
    binary_rules.unshift("0") while binary_rules.length < 8
    binary_rules
  end

  def ruleset
    STATES.dup.zip(to_binary_list).to_h
  end
end
