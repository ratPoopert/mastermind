# frozen_string_literal: true

require './game.rb'

# 1. Display a title screen until the player presses Enter.
# 2. Ask the player for their name.
# 3. Greet the player by name and ask them if the way to play as the Codemaker or the Codebreaker.
# 4. The Codemaker creates the master_code.
# 5. The Codebreaker guesses the code.
# 6. If the guess is correct, the Codebreaker wins and the game ends. Proceed to Step 10.
# 7. If the Codebreaker has made 12 incorrect guesses, the Codemaker wins. Proceed to Step 10.
# 8. The Codemaker compares the guess to the master_code and provides feedback to the Codebreaker.
# 9. The Codebreaker analyzes the feedback. Return to Step 6.
# 10. Announce the winner.
# 11. Ask the player if they want to play again. If yes, return to Step 3. If not, exit the game.

Game.new
