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
    return CodeMaker if input == "1"
    return CodeBreaker if input == "2"

    puts invalid_role_error(input)
    choose_player_role(player)
  end

  def enter_master_code
    puts master_code_prompt
    input = gets.chomp
    return Code.new(input) if Code.valid?(input)

    puts invalid_code_error(input)
    self.enter_master_code
  end
end
