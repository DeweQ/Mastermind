require_relative "../sequence"

module Mastermind
  # Class containing a secrete code. Validates sequence on initializing
  class SecretCode < Sequence
    def initialize(colors)
      raise ArgumentError, "Colors in secret code must be unique" unless valid?(colors)

      super
    end

    def valid?(colors)
      colors.uniq.size == colors.size
    end
  end
end
