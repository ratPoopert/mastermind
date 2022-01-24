# frozen_string_literal: true
require './code.rb'

# Handles functionality for the Codemaker role.
class CodeMaker
  def create_master_code
    code_string = String.new
    4.times do
      code_string << rand(1..6).to_s
    end
    Code.new(code_string)
  end
end