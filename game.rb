# frozen_string_literal: true

require_relative 'code_breaker'
require_relative 'code_maker'
require_relative 'display'
require_relative 'player'

# Handles the functionality of a Mastermind game.
class Game
  include Display

  def initialize
    puts welcome_message
    @player = Player.new
    @game_number = 0
  end

  def play
    @game_number += 1
    max_attempts = 12
    @player.choose_role
    @code_maker = CodeMaker.new(@player.role)
    @code_breaker = CodeBreaker.new(@player.role)
    @code = @code_maker.make_code
    until @code.broken? || @code_breaker.attempts = @max_attempts do
      @code_breaker.break_code(@code)
      @code_maker.give_feedback(@code_breaker.guess)
    end
    end_game
  end

  def end_game
    display_result
    @player.play_again? ? play : system 'exit'
  end
end