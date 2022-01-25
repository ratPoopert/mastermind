# frozen_string_literal: true

require './input.rb'
require './display.rb'
require './human.rb'

# Represents the human player of a Mastermind game.
class Player
  include Input
  include Display

  attr_reader :name, :role

  def initialize
    @name = enter_player_name
  end

  def choose_role
    @role = choose_player_role(self).prepend(Human)
  end
end
