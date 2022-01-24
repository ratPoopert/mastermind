# frozen_string_literal: true

require './display.rb'

# Functionality for collecting and validating user input.
module Input
  include Display

  def player_name
    puts name_prompt
    gets.chomp
  end
end
