require_relative "../sequence"

module Mastermind
  # Class containing a secrete code. Validates sequence on initializing
  class SecretCode < Sequence
    def initialize(colors)
      unless SecretCode.valid?(colors)
        raise ArgumentError,
              "Secret code must be a sequence of 4 unique colors from the list of available colors"
      end

      super
    end

    def self.valid?(colors)
      colors.uniq.size == colors.size &&
        colors.size == 4 &&
        colors.all? { |color| Sequence.colors.include? color }
    end
  end
end
