require_relative "guesser"
require_relative "mastermind"
require_relative "sequence"
require_relative "sequence/feedback"
require_relative "sequence/secret_code"

module Mastermind
  # Game master class.
  class Game
    attr_reader :winner, :code

    def initialize(mastermind, guesser, difficulty: 6)
      @mastermind = mastermind
      @guesser = guesser
      @mastermind.difficulty = difficulty
      @guesser.difficulty = difficulty
      @history = []
      @finished = false
      @code = @mastermind.generate_code
    end

    def finished?
      @finished
    end

    def play
      rounds = 0
      feedback = ""
      loop do
        rounds += 1
        feedback = play_round
        break if feedback.correct? || rounds >= 12
      end
      @finished = true
      @winner = feedback.correct? ? "Guesser" : "Mastermind"
      finalize
    end

    private

    def play_round
      update_display
      guess = @guesser.make_guess
      feedback = @mastermind.give_feedback(guess)
      @history << [guess, feedback]
      feedback
    end

    def finalize
      update_display
      puts "Winner is #{@winner}" if finished?
      puts "Secret code is #{@code.display}" if @winner == "Mastermind"
    end

    def update_display
      system("clear") || system("cls")
      puts "*** MASTERMIND ***"
      @history.each do |entry|
        puts "#{entry[0].display}  :  #{entry[1].to_seq.display}"
      end
    end
  end
end
