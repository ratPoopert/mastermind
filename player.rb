# frozen_string_literal: true

require './input.rb'
require './display.rb'
require './human.rb'

# Represents the human player of a Mastermind game.
class Player
  include Display, Input

  attr_reader :name, :role

  def initialize
    @name = player_name
    puts greet_player(@name)
  end

  def choose_role
    @role = choose_player_role(self)
    @role.prepend(Human)
  end
end
