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
end
