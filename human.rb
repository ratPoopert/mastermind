# frozen_string_literal: true

require './input.rb'

# Holds functionality for overriding computer handling of roles with user input.
module Human
  include Input

  def create_master_code
    Code.new(enter_master_code)
  end

  def guess_code(current_turn)
    code_string = enter_guess(current_turn)
    @current_guess = Guess.new(code_string)
  end

  def give_feedback(current_guess)
    current_guess.compare(self.code)
    enter_feedback(current_guess, self.code)
  end

  def analyze_feedback
    puts display_feedback(@current_guess)
  end
end
