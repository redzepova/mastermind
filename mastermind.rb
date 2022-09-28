# frozen_string_literal: true

## module to display all text
module Display
  def game_options
    puts "Select difficulty level. \n
        1 - Easy  2 - Medium  3 - Difficult"
    gets.chomp.to_i
  end

  def mode_selection
    puts "Do you want to be the Code Maker, or the Code Breaker? \n
      1 - Code Maker  2 - Code Breaker"
  end

  def show_rules
    puts 'Would you like to see the game rules before we start? Y/N'
    answer = gets.chomp
    game_rules(answer)
  end

  def game_rules(ans)
    return unless ans == 'Y'

    puts "Mastermind is a logic game. One player chooses a code. The other player must guess that code
within the specified number of turns.

Each code is 5 numbers long, and each number can be between 1-6. Numbers may repeat.

Once the Code Maker has created a code, the Code Breaker must enter their guess. The Computer will analyze the
code and return feedback for each digit of the code.
    [   ] - Not a match
    [ O ] - Right digit, but wrong spot
    [ X ] - Right digit, right spot

For example, if the code is 12655, and the Code Breaker guesses 22456, the feedback would be:
    [   ][ X ][   ][ X ][ O ]

Now onto the game!
"
  end

  def guess_text
    puts 'Enter your code. Codes must be 5 digits long, and can use whole numbers between 1-6'
  end

  def bad_choice
    puts 'You must select a number from 1 -6. Try again.'
  end
end

## Code and guesses
class Code
  include Display
  attr_accessor :code

  CHOICES = [1, 2, 3, 4, 5, 6].freeze

  def initialize(mode = 'CB')
    mode == 'CB' ? get_code : create_random_code
  end

  def get_code
    guess_text
    @code = gets.chomp.split(//).map(&:to_i)
    puts @code.to_s
  end

  def create_random_code
    @code = CHOICES.repeated_permutation(5).to_a.sample
    puts @code.to_s
  end
end

## Game set-up functions, gets player, basic game info
module GameSetup
  include Display

  def game_level(level)
    turns = case level
            when 1
              8
            when 2
              6
            else
              5
            end
  end

  def game_mode
    mode_selection
  end
end

## Where the game takes place
class Game
  include Display
  include GameSetup

  attr_accessor :mode

  def initialize
    show_rules
    @mode = HumanCodeBreak.new
    @turns = game_level(game_options)
    @master_code = Code.new('CM')
  end

  def play_round
    @mode.make_guess
    @turns += -1
  end

  def play_game
    @mode.make_guess
    play_round until @mode.guess.code == @master_code.code || @turns.zero?
  end
end

# #This is the human player. Can be codemaker or breaker
class HumanCodeBreak
  include Display
  attr_accessor :guess

  def initialize; end

  def make_guess
    @guess = Code.new
  end

  def role(choice)
    choice == 1 ? 'CM' : 'CB'
  end
end

## Computer player. Can create codes and make guesses
class ComputerCodeBreak
  def initialize; end
end

## Logic module for computer guesses, eventually
module Logic
end

## This is the module to evalute codes/guesses and give feedback
class Feedback
end

Game.new.play_game
