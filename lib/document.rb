require "prawn"

class Document
  include Prawn::View

  def initialize(automaton, word_pair, swatch, timestamp)
    @automaton = automaton
    @word_pair = word_pair
    @swatch = swatch
    @timestamp = timestamp
    @document = Prawn::Document.new(page_size: "A4")
    font_families.update(
      "PT Mono" => {
        normal: "fonts/PTM55FT.ttf"
      },
      "PT Serif" => {
        normal: "fonts/PTF55F.ttf",
        bold: "fonts/PTF75F.ttf"
      }
    )
  end

  def generate_lines
    zero = "<color rgb='#{@swatch.light}'>#{@word_pair.first}</color>"
    one = @word_pair.last

    @automaton.generate.map do |line|
      line.map do |bit|
        case bit.to_i
        when 0 then zero
        when 1 then one
        end
      end.join("")
    end
  end

  def render_colophon
    start_new_page(margin: 90)

    font("PT Serif") do
      move_down 384
      font_size(18) { text("Colophon") }
      move_down 12
      text(File.read("./content/colophon.txt"))
    end
  end

  def render_preface
    start_new_page(margin: 72)

    font("PT Serif") do
      move_down 384
      font_size(18) { text("Preface") }
      move_down 12
      text(File.read("./content/preface.txt"))
    end
  end

  def render_copyright
    start_new_page(margin: 90)

    font("PT Serif") do
      move_down 384
      text(File.read("./content/copyright.txt"), align: :center)
    end
  end

  def render_half_title
    start_new_page

    font("PT Serif") do
      move_down 128
      font_size(18) { text("Emic Automata", align: :center) }
    end
  end

  def render_title
    start_new_page

    font("PT Serif", style: :bold) do
      move_down 128
      font_size(36) { text("Emic Automata", align: :center) }
      move_down 18
      font_size(18) { text("By Mark Rickerby", align: :center) }
    end
  end

  def render_body
    start_new_page(margin: 36)

    font("PT Mono") do
      generate_lines.each do |line|
        text(line, color: @swatch.dark, align: :center, inline_format: true)
      end
    end
  end

  def render_contents
    start_new_page

    font("PT Mono") do
      move_down 128
      font_size(36) { text(@word_pair.title, align: :center) }
      move_down 18
      font_size(18) { text("Rule #{@automaton.rule.id}", align: :center) }
    end

    move_down 36
    image("output/rule-#{@timestamp}.png", position: :center)
  end

  def render_cover
    canvas do
      transparent(0.1) do
        image("output/cover-#{@timestamp}.png", position: :center, vposition: :center, scale: 2.834)
      end

      font("PT Mono") do
        fill_color "222222"
        font_size(42) { draw_text(@word_pair.title, at: [56, 90]) }
      end
    end
  end

  def render_sections
    render_cover
    render_half_title
    render_title
    render_copyright
    render_preface
    start_new_page
    render_contents
    render_body
    start_new_page
    render_colophon
  end
end
