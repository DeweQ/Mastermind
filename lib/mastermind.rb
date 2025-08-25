module Mastermind
  # Mastermind parent class. Generating secret code and feedback for player's guess.
  class Mastermind
    attr_accessor :difficulty
    attr_reader :code

    def generate_code
      %i[blue yellow red green]
    end

    def give_feedback(guess)
      # TODO: fill method
    end

    protected

    attr_writer :code
  end
end
