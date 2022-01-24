# frozen_string_literal: true

require './input.rb'

# Represents the human player of a Mastermind game.
class Player
  include Input

  def initialize
    @name = player_name
  end
end
