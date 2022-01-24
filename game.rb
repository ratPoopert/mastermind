# frozen_string_literal: true

require './codemaker.rb'
require './display.rb'
require './input.rb'
require './player.rb'

# Controls Mastermind game functionality.
class Game
  include Display

  def initialize
    display_title_screen
    @player = Player.new
    play_game
  end

  def play_game
    @player.choose_role
    @code_maker = CodeMaker.new
    @master_code = @code_maker.create_master_code
  end

  def display_title_screen
    puts title_screen
    gets
    system 'clear'
  end
end
