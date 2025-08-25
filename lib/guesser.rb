require_relative "../lib/sequence"

module Mastermind
  # Guesser parent class
  class Guesser
    def make_guess(colors)
      Sequence.new(colors)
    end
  end
end
