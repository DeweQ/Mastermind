require "colorize"

module Mastermind
  # Contains a sequence of colors.
  class Sequence
    def initialize(colors)
      @colors = colors
    end

    def display
      @colors.reduce("") do |result, c|
        result << "⬤".colorize(c)
        result
      end
    end

    def to_s
      @colors.to_s
    end
  end
end
