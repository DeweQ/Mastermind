require "colorize"

module Mastermind
  # Contains a sequence of colors.
  class Sequence
    include Enumerable

    def self.colors
      %i[red green blue yellow magenta cyan grey white]
    end

    def initialize(colors = %i[red green blue yellow])
      @colors = colors
      @colors.freeze
      @display = ""
    end

    def display
      return @display unless @display == ""

      @colors.each do |c|
        @display << "⬮".colorize(c)
      end
      @display = @display.colorize(background: :black)
      @display
    end

    def each(&block)
      @colors.each(&block)
    end

    def [](index)
      @colors[index]
    end

    def to_s
      @colors.to_s
    end

    protected

    attr_writer :display
  end
end
