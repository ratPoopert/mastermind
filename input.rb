# frozen_string_literal: true

require './codebreaker.rb'
require './codemaker.rb'
require './display.rb'

# Functionality for collecting and validating user input.
module Input
  include Display

  def player_name
    puts name_prompt
    gets.chomp
  end

  def choose_player_role(player)
    puts role_prompt(player.name)
    input = gets.chomp
    return CodeMaker if input == '1'
    return CodeBreaker if input == '2'

    puts invalid_role_error(input)
    choose_player_role(player)
  end

  def enter_master_code
    enter_code(master_code_prompt)
  end

  def enter_guess(current_turn)
    enter_code(guess_code_prompt(current_turn))
  end

  def enter_code(prompt)
    puts prompt
    input = gets.chomp
    return input if Code.valid?(input)

    puts invalid_code_error(input)
    enter_code(prompt)
  end

  def enter_exact_feedback(exact_match_count)
    puts exact_feedback_prompt
    input = gets.chomp.to_i
    return if input == exact_match_count

    puts invalid_feedback_error(input)
    enter_exact_feedback(exact_match_count)
  end

  def enter_partial_feedback(partial_match_count)
    puts partial_feedback_prompt
    input = gets.chomp.to_i
    return if input == partial_match_count

    puts invalid_feedback_error(input)
    enter_partial_feedback(partial_match_count)
  end
  
  def enter_feedback(current_guess, code)
    puts display_current_guess(current_guess, code)
    enter_exact_feedback(current_guess.exact_match_count)
    enter_partial_feedback(current_guess.partial_match_count)
  end

  def play_again?
    puts play_again_prompt
    input = gets.chomp.downcase
    input == "y"
  end
end
