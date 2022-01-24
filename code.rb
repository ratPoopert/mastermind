# frozen_string_literal: true

# Represents a 4-digit Mastermind code.
class Code
  def initialize(string)
    @value = string
  end

  def to_s
    @value
  end

  def to_a
    @value.chars
  end

  def self.valid?(string)
    string.match?(/\A[1-6]{4}\Z/)
  end
end