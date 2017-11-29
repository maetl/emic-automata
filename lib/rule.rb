class Rule
  INTERESTING_RULES = [
    30,
    106,
    110
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
