require_relative "../guesser"
require_relative "../sequence"

module Mastermind
  # Computer guesser class
  class ComputerGuesser < Guesser
    attr_reader :possible_codes

    def initialize(difficulty = 6)
      self.difficulty = difficulty
      super()
    end

    def make_guess
      guess = possible_codes.sample
      super(guess)
    end

    def difficulty=(number)
      curr = difficulty
      return if curr == number

      super
      initialize_possible_codes
    end

    def initialize_possible_codes
      @possible_codes = Sequence.colors.first(difficulty).permutation(4).to_a
    end
  end
end
