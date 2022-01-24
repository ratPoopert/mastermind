# frozen_string_literal: true

require './display.rb'

# Controls Mastermind game functionality.
class Game
  include Display

  def initialize
    display_title_screen
  end

  def display_title_screen
    puts title_screen
    gets
    system 'clear'
  end
end
