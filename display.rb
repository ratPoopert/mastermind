# frozen_string_literal: true

# Messages for the user to read.
module Display
  def title_screen
    <<~TITLE_SCREEN
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

  def role_prompt(player_name)
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
end
