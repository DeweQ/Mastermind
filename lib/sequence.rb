require "colorize"

module Mastermind
  # Contains a sequence of colors.
  class Sequence
    def initialize(colors = %i[red green blue yellow])
      @colors = colors
      @display = ""
    end

    def display
      return @display unless @display == ""

      @colors.each do |c|
        @display << "⬮".colorize(c)
      end
      @display
    end

    def to_s
      @colors.to_s
    end

    protected

    attr_writer :display
  end
end
