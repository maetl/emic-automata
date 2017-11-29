require "png"

class RuleImage
  WIDTH = 200
  HEIGHT = 200

  def initialize(cells, light, dark)
    @pixels = cells.slice(0, WIDTH)
    @light_color = light
    @dark_color = dark
  end

  def save(filename)
    canvas = PNG::Canvas.new(WIDTH, HEIGHT)

    @pixels.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        canvas[x, y] = if cell == "0"
          PNG::Color.from("0x#{@dark_color}FF")
        else
          PNG::Color.from("0x#{@light_color}FF")
        end
      end
    end

    png = PNG.new(canvas)
    png.save(filename)
  end
end
