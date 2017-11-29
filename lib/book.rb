class Book
  WORD_COUNT = 50_000

  def initialize(output_path: "output")
    @output_path = output_path
    @timestamp = Time.new.to_i
    @rule = Rule.new
    @swatch = Swatch.new
    @word_length = WordLength.new.sample
    @word_pair = WordPair.new(@word_length)
  end

  def generate_rule_image
    image = RuleImage.new(automaton.generate, @swatch.light, @swatch.dark)
    image.save("#{@output_path}/cover-#{@timestamp}.png")
  end

  def generate_document
    document = Document.new(
      automaton(width: page_width, generations: page_generations),
      @word_pair,
      @swatch,
      @timestamp
    )
    document.render_sections
    document.save_as("#{@output_path}/book-#{@timestamp}.pdf")
  end

  def page_width
    (74.0 / @word_length).floor
  end

  def page_generations
    (WORD_COUNT * 1.0 / page_width).ceil
  end

  def generate
    generate_rule_image
    generate_document
  end

  def automaton(width: 200, generations: 200)
    Automaton.new(rule: @rule, width: width, generations: generations)
  end
end
