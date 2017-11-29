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
    image = RuleImage.new(automaton(200, 200).generate, @swatch.light, @swatch.dark, 200, 200)
    image.save("#{@output_path}/rule-#{@timestamp}.png")
  end

  def generate_cover_image
    image = RuleImage.new(automaton(210, 297).generate, @swatch.light, @swatch.dark, 210, 297)
    image.save("#{@output_path}/cover-#{@timestamp}.png")
  end

  def generate_document
    document = Document.new(automaton(page_width, page_generations), @word_pair, @swatch, @timestamp)
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
    generate_cover_image
    generate_rule_image
    generate_document
  end

  def automaton(width, generations)
    @seed_generation ||= Array.new(width, "0").map do
      rand > 0.5 ? "1" : "0"
    end

    Automaton.new(rule: @rule, width: width, generations: generations, seed: @seed_generation.slice(0, width))
  end
end
