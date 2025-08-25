require_relative "../sequence"

module Mastermind
  # Generate feedback on player's guess and validate player's feedback
  class Feedback
    def initialize(whites = 0, reds = 0)
      @whites = whites
      @reds = reds
    end

    def self.generate_feedback(code, guess)
      # debugger
      whites = 0
      reds = 0
      code.each_with_index do |color, i|
        if code[i] == guess[i]
          reds += 1
          next
        end
        whites += 1 if guess.include?(color)
      end
      Feedback.new(whites, reds)
    end

    def to_seq
      beads = []
      @whites.times { beads << :white }
      @reds.times { beads << :red }
      Sequence.new(beads)
    end

    def to_s
      "w:#{@whites} - r:#{@reds}"
    end
  end
end
