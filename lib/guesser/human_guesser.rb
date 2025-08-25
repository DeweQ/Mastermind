require_relative "../guesser"

module Mastermind
  # Human guesser class
  class HumanGuesser < Guesser
    def make_guess
      # debugger
      puts "Enter a guess. Your guess should be a sequence of 4 colors, separated by space."
      puts "Available colors: red, green, blue, yellow, magenta, cyan, grey and white"
      input = gets.chomp.downcase.split.map(&:to_sym)
      super(input)
    end
  end
end
