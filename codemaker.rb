# frozen_string_literal: true

require './code.rb'
require './display.rb'

# Handles functionality for the Codemaker role.
class CodeMaker
  include Display
  
  attr_reader :code

  def initialize
    @code = create_master_code
  end

  def create_master_code
    code_string = String.new
    4.times do
      code_string << rand(1..6).to_s
    end
    Code.new(code_string)
  end

  def give_feedback(guess)
    guess.compare(@code)
  end
end
