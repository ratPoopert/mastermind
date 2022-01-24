# frozen_string_literal: true
require './input.rb'

# Holds functionality for overriding computer handling of roles with user input.
module Human
  include Input

  def create_master_code
    Code.new(enter_master_code)
  end
end