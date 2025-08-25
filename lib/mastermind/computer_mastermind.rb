require_relative "../mastermind"
require_relative "../sequence"
require_relative "../sequence/secret_code"
require_relative "../sequence/feedback"

module Mastermind
  # Computer version of mastermind
  class ComputerMastermind < Mastermind
    attr_reader :code

    def initialize(output = puts, difficulty = 6)
      @output = output
      @difficulty = difficulty
      super()
    end

    def generate_code
      @code = SecretCode.new(Sequence.colors.first(@difficulty).sample(4))
    end

    def give_feedback(guess)
      Feedback.generate_feedback(@code, guess)
    end
  end
end
