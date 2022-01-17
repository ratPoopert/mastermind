# frozen_string_literal: true

# Handles functionality of a Mastermind codemaker.
class CodeMaker
  def initialize(player)
    @player = player
    @is_player = is_player?(player.role)
  end

  def check_for_winner(guess)
    code_breaker.win if guess == @code
  end

  def count_partial_matches(inexact_matches)
    partial_matches = 0
    code, guess = inexact_matches.transpose
    guess.each do |digit|
    if code.include?(digit)
      partial_matches += 1
      code.delete(digit)
    end
  end

  def create_pairs(guess)
    @code.zip(guess)
  end

  def display_code
    @code.join
  end

  def display_feedback(exact_match_count, partial_match_count)
    <<-FEEDBACK
    Exact matches: #{exact_match_count}
    Partial matches: #{partial_match_count}
    FEEDBACK
  end

  def find_exact_matches(pairs)
    pairs.select {|pair| pair[0] == pair[1]}
  end

  def give_feedback(code_breaker)
    if @is_player
      @player.give_feedback(code_breaker.guess)
    else
      check_for_winner(code_breaker.guess)
      pairs = create_pairs(code_breaker.guess)
      exact_matches = find_exact_matches(pairs)
      inexact_matches = pairs - exact_matches
      exact_match_count = exact_matches.count
      partial_match_count = count_partial_matches(inexact_matches)
      puts display_feedback(exact_match_count, partial_match_count)
  end

  def is_player?(player.role)
    player.role == 'codemaker'
  end

  def make_code
    if @is_player
      @code = @player.make_code
    else
     @code = []
     4.times do
      digit = rand(1..6)
      @code.push(digit)
     end
    end
  end
end