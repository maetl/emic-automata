class Automaton
  attr_reader :rule

  def initialize(rule: Rule.new, width: 200, generations: 200)
    @rule = rule
    @width = width
    @generations = generations
  end

  def generate
    first_generation = Array.new(@width, "0").map do
      rand > 0.5 ? "1" : "0"
    end

    cells = [first_generation]

    (@generations-1).times do |row|
      next_generation = []
      0.upto(@width-1) do |col|

        left = if col == 0
          @width-1
        else
          col - 1
        end

        right = if col == @width-1
          0
        else
          col + 1
        end

        l_cell = cells.last[left]
        m_cell = cells.last[col]
        r_cell = cells.last[right]

        if l_cell != '-1' && m_cell != '-1' && r_cell != '-1'
          state = l_cell + m_cell + r_cell
          next_generation << rule.ruleset[state]
        else
          next_generation = '-1'
        end
      end
      cells << next_generation
    end

    cells
  end
end
