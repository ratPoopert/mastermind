# frozen_string_literal: true

require './display.rb'
require './player.rb'

# Controls Mastermind game functionality.
class Game
  include Display

  def initialize
    display_title_screen
    @player = Player.new
  end

  def display_title_screen
    puts title_screen
    gets
    system 'clear'
  end
end
