# frozen_string_literal: true

# Messages for the user to read.
module Display
  def title_screen
    <<~'TITLE_SCREEN'
       __  __           _                      _           _ 
      |  \/  |         | |                    (_)         | |
      | \  / | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |
      | |\/| |/ _` / __| __/ _ \ '__| '_ ` _ \| | '_ \ / _` |
      | |  | | (_| \__ \ ||  __/ |  | | | | | | | | | | (_| |
      |_|  |_|\__,_|___/\__\___|_|  |_| |_| |_|_|_| |_|\__,_|

                  Press ENTER to continue.
    TITLE_SCREEN
  end

  def name_prompt
    'What is your name?'
  end

  def greet_player(player_name)
    "\nHello, #{player_name}!"
  end

  def role_prompt(_player_name)
    <<~ROLE_PROMPT
    
      Please select your role by entering the corresponding number:
        1 - codeMAKER (Creates the Master Code and provides feedback on guesses)
        2 - codeBREAKER (Tries to guess the Master Code)
    ROLE_PROMPT
  end

  def invalid_role_error(input)
    "\nI'm sorry, but #{input} is not a valid role selection. Please try again!\n"
  end

  def master_code_prompt
    <<~MASTER_CODE_PROMPT

      Please enter a 4-digit Master Code for this game.
      Each digit can range from 1 to 6. For example:
        "1562" is a valid code.
        "9807" is not a valid code.
    MASTER_CODE_PROMPT
  end

  def invalid_code_error(input)
    "\nI'm sorry, but #{input} is not a valid code. Please try again!\n"
  end

  def guess_code_prompt(current_turn)
    case current_turn
    when 1
      "\nTry to guess the Master Code!"
    when 12
      "\nThis is your last try!"
    else
      "\nTry again! Attempt #{current_turn}/12"
    end
  end

  def display_feedback(guess)
    <<~FEEDBACK
      You guessed #{guess}
      Exact matches: #{guess.exact_match_count}
      Partial matches: #{guess.partial_match_count}
    FEEDBACK
  end

  def display_current_guess(guess, code)
    <<~CURRENT_GUESS

      The Master Code is:   #{code}
      The computer guessed: #{guess}
      
    CURRENT_GUESS
  end

  def exact_feedback_prompt
    "Enter the number of digits in the computer's guess that match the Master Code in value and position:"
  end

  def partial_feedback_prompt
    "Enter the number of remaining digits in the computer's guess that match the Master Code in value, but NOT position."
  end

  def invalid_feedback_error(input)
    "I'm sorry, but #{input} is not the correct number of matches. Please try again!"
  end

  def display_result(winner, player_role)
    winner.class.name == player_role.to_s ? "\nYou won!" : "\nYou lost!"
  end

  def play_again_prompt
    "Enter 'Y' to play again. Enter any other key to exit."
  end
end
