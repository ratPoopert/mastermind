# frozen_string_literal: true

require './codemaker.rb'
require './display.rb'
require './input.rb'
require './player.rb'

# Controls Mastermind game functionality.
class Game
  include Display, Input

  def initialize
    display_title_screen
    @player = Player.new
    play_game
  end

  def play_game
    system 'clear'
    @player.choose_role
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @master_code = @code_maker.code
    take_turns
    puts display_result(@winner, @player.role)
    play_again? ? play_game : (system 'exit')
  end

  def take_turns
    @current_turn = 0
    loop do
      @current_turn += 1
      @code_breaker.guess_code(@current_turn)
      check_for_winner
      return if @winner

      system 'clear'
      @code_maker.give_feedback(@code_breaker.current_guess)
      @code_breaker.analyze_feedback
    end
  end

  def check_for_winner
    if @code_breaker.current_guess.value == @master_code.value
      @winner = @code_breaker
    elsif @current_turn == 12
      @winner = @code_maker
    end
  end

  def display_title_screen
    puts title_screen
    gets
    system 'clear'
  end
end
