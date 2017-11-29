class WordList
  def initialize(word_length)
    @word_length = word_length
    @lines = File.open("data/words_alpha.txt").each_line.lazy
  end

  def prune_list
    @words ||= @lines.map(&:strip).select { |word| word.length == @word_length }.to_a
  end

  def sample_pair
    prune_list

    zero = @words.sample

    while one = @words.sample
      break if one != zero
    end

    [zero.upcase, one.upcase]
  end
end
