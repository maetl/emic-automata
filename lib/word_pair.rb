class WordPair
  TITLE_JOINERS = ["/", "&", "|", "–", ": ", ":", "^", " ", "~", "/", "|"]

  attr_reader :first, :last

  def initialize(word_length)
    @first, @last = WordList.new(word_length).sample_pair
  end

  def title
    @title ||= [@first, @last].sort.join(TITLE_JOINERS.sample)
  end
end
