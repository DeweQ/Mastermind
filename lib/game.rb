require_relative "guesser"
require_relative "mastermind"
require_relative "sequence"
require_relative "sequence/feedback"
require_relative "sequence/secret_code"

module Mastermind
  # Game master class.
  class Game
    def initialize(mastermind, guesser, difficulty: 6)
      @mastermind = mastermind
      @guesser = guesser
      @mastermind.difficulty = difficulty
      @guesser.difficulty = difficulty
    end

    def play_round
      guess = @guesser.make_guess
      puts guess.display
      @mastermind.give_feedback(guess)
    end

    def play
      code = @mastermind.generate_code
      rounds = 0
      loop do
        feedback = play_round
        rounds += 1
        puts feedback.to_seq.display
        break if feedback.correct? || rounds >= 12
      end
    end
  end
end
