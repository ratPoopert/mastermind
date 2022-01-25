# frozen_string_literal: true

# Represents a 4-digit Mastermind code.
class Code
  attr_reader :value

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

# Represents a Mastermind Code Breaker's guess.
class Guess < Code
  attr_accessor :exact_match_count, :partial_match_count

  def compare(code)
    @matched_pairs = match_pairs(code)
    @exact_matches = exact_matches
    @exact_match_count = @exact_matches.count
    @partial_match_count = count_partial_matches
  end

  private

  def match_pairs(code)
    code.to_a.zip(to_a)
  end

  def exact_matches
    @matched_pairs.select { |code, guess| code == guess }
  end

  def count_partial_matches
    count = 0
    inexact_matches = @matched_pairs - @exact_matches
    code, guess = inexact_matches.transpose
    guess.each do |this|
      if code.include?(this)
        count += 1
        code.delete_at(code.index(this))
      end
    end
    count
  end
end
