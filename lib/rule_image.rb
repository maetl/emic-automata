require "png"

class RuleImage
  def initialize(cells, light, dark, width, height)
    @pixels = cells.slice(0, height)
    @light_color = light
    @dark_color = dark
    @canvas = PNG::Canvas.new(width, height)
  end

  def save(filename)
    @pixels.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        @canvas[x, y] = if cell == "0"
          PNG::Color.from("0x#{@dark_color}FF")
        else
          PNG::Color.from("0x#{@light_color}FF")
        end
      end
    end

    png = PNG.new(@canvas)
    png.save(filename)
  end
end
