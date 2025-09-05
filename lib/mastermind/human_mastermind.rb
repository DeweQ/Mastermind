require_relative "../mastermind"
require_relative "../sequence"
require_relative "../sequence/secret_code"
require_relative "../sequence/feedback"

module Mastermind
  # Human player as Mastermind
  class HumanMastermind < Mastermind
    def generate_code
      input = []
      validate_inputt = []
      loop do
        puts "Create a code consisting of 4 distinct colors."
        puts "Available colors: #{Sequence.colors.first(difficulty).join ', '}"
        input = gets.chomp.split.map(&:to_sym)
        # TODO: Clean this mess
        break if validate_input(input)
        
        

        puts "Secret code must be a sequence of 4 distinct colors from available color list"
      end
      self.code = SecretCode.new(input)
    end

    def give_feedback(guess)
      # TODO: Give ability for the player to give feedback themselves
      Feedback.generate_feedback(code, guess)
    end

    private

    def validate_input(colors)
      validity = SecretCode.valid?(colors)
      self.code = SecretCode.new(colors) if validity
      validity
    end
  end
end
