# frozen_string_literal: true

# Handles functionality for the Codebreaker role.
class CodeBreaker
  attr_reader :current_guess

  def initialize
    @possible_guesses = all_possible_guesses
  end

  def guess_code(_current_turn)
    @current_guess = @possible_guesses.shift
    @possible_guesses
  end

  def all_possible_guesses
    all_codes = []
    valid_strings = ('1111'..'6666').select { |string| Guess.valid?(string) }
    valid_strings.each { |string| all_codes.push(Guess.new(string)) }
    all_codes
  end

  def analyze_feedback
    compare_remaining_guesses
    eliminate_possible_guesses
  end

  def compare_remaining_guesses
    @possible_guesses.each do |this|
      this.compare(@current_guess)
    end
  end

  def eliminate_possible_guesses
    @possible_guesses.select! do |this|
      this.exact_match_count == @current_guess.exact_match_count &&
        this.partial_match_count == @current_guess.partial_match_count
    end
  end
end
