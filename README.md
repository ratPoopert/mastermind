# Mastermind
[The Odin Project]: https://www.theodinproject.com/
[Project: Mastermind]: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind
[Mastermind (board game) - Wikipedia]: https://en.wikipedia.org/wiki/Mastermind_(board_game)

## The Goal

From [Project: Mastermind] ([The Odin Project])

> Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer's random code.
>
>1. Think about how you would set this problem up!
>2. Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!
>3. Now refactor your code to allow the human player to choose whether they want to be the creator of the secret code or the guesser.
>4. Build it out so that the computer will guess if you decide to choose your own colors. You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.
>5. If you choose to modify the rules, you can provide the computer additional information about each guess. For example, you can start by having the computer guess randomly, but keep the ones that match exactly. You can add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.
>6. If you want to follow the rules of the game, you'll need to research strategies for solving Mastermind, such as this [post](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind).

## The Game

Key Points from [Mastermind (board game) - Wikipedia]:

* Decoding board
  * Shield at one end protects 4 large holes from being seen by the codebreaker.
  * 12 rows, each with 4 large holes for code pegs and 4 small holes for key pegs.
* Code pegs
  * 6 different colors.
  * Placed in the large holes.
* Key pegs
  * Black
  * White
* Codemaker
  * Chooses a pattern of 4 code pegs and places them in the shielded holes.
  * Gives feedback to the codebreaker about the correctness of their guesses by placing key pegs.
    * Black for each code peg which is correct in both color and position.
    * White for each code peg which is the correct color, but in the wrong position.
    * If there are duplicate colors in the guess, they cannot all be awarded a key peg unless they correspond to the same number of duplicate colors in the hidden code.
      * For example:
        * Code: Red-Red-Blue-Blue
        * Guess: Red-Red-Red-Blue
        * Feedback:
          * 2 black keys (Red-Red)
          * No key (3rd Red)
          * 1 black key (Blue)
* Codebreaker
  * Objective: guess the codemaker's code, in order and color, within 12 turns.

## Pseudocode

* Display a welcome message.
* Ask the user to enter their name. Store their response in `player_name`.
* Create an array, `code`, containing 4 integers, each with a random value from 1 to 6 inclusive.
* Ask the user to input a 4-digit guess, with each digit ranging from 1 to 6. Store their response in `guess`.
* Validate the user's input.
* Compare the player's guess to the original code.
  * Convert `guess` to an array, with each digit as an item.
  * Increment `black_key_pegs` by 1 for each item in `guess` that matches an item in `code` by value and position.
  * Increment `white_key_pegs` by 1 for each remaining item in `guess` which matches the value of an item in `code`.
  * Note: This will probably involve a few rounds of filtering so the arrays gradually shrink to only contain unmatching values.
* Display the number of `black_key_pegs` and `white_key_pegs` to the user.
* Repeat this process until the user correctly guesses the code, or until they have made 12 incorrect guesses.
* Display the result (win/loss) to the user.
* Ask the user if they want to play again. If yes, return to the 3rd step. If no, exit the program.