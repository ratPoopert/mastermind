# frozen_string_literal: true

# A game of Mastermind
def end_game(code)
  puts "The computer wins! Their code was #{code.join('')}."
  play if play_again?
end

def evaluate_guess(guess, code)
  black_key_pegs = 0
  white_key_pegs = 0
  guess_array = create_guess_array(guess)

  if guess_array == code
    win
    return
  end

  guess_array.length.times do |i|
    if guess_array[i] == code[i]
      black_key_pegs += 1
    elsif code.include?(guess_array[i])
      white_key_pegs += 1
    end
  end
  p guess_array
  p code
  puts <<-FEEDBACK
  The computer has some feedback about your guess:
    Black key pegs: #{black_key_pegs}
    White key pegs: #{white_key_pegs}
  FEEDBACK
end

def create_guess_array(guess)
  guess_array = []
  guess.each_char { |char| guess_array.push(char.to_i)}
  guess_array
end

def get_guess(guess_prompt)
  puts guess_prompt
  gets.chomp
end

def guess_error(guess)
  "I'm sorry, but #{guess} is not a valid guess. Please try again."
end

def guess_prompt
  "Please enter a guess of 4-digits, each ranging from 1 to 6."
end

def guess_valid?(guess)
  guess.match(/\A[1-6]{4}\z/)
end

def play
  code_chosen_message = "The computer has chosen the code!"
  welcome_message = "Let's play Mastermind!\n"
  win_message = "You guessed the computer's code! You won!"
  puts welcome_message
  
  puts "What is your name?"
  player_name = gets.chomp
  
  code = [1, 1, 2, 2]
  # 4.times do
    # code_peg = rand(1..6)
    # code.push(code_peg)
  # end
  
  puts code_chosen_message
  number_of_guesses = 0
  until number_of_guesses == 12
    guess = ""
    number_of_guesses += 1
    puts "Guess number: #{number_of_guesses}"
    loop do
      guess = get_guess(guess_prompt) 
      break if guess_valid?(guess)

      puts guess_error(guess)
    end
    win if winner?(guess, code)
    evaluate_guess(guess, code)
  end
  end_game(code)
end

def play_again?
  puts "Enter 'Y' to play again. Enter any other key to exit."
  gets.chomp.downcase == 'y'
end

def win
  puts "You guessed the computer's code! You won!"
  play if play_again?
end

def winner?(guess, code)
  guess_array = create_guess_array(guess)
  guess_array == code
end

play