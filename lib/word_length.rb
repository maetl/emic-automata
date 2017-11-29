require "calyx"

class WordLength < Calyx::Grammar
  weighted_word_lengths(
    '3' => 30,
    '4' => 20,
    '5' => 15,
    '6' => 15,
    '7' => 10,
    '8' => 10
  )

  def sample
    generate(:weighted_word_lengths).to_i
  end
end
