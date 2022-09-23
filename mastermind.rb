# frozen_string_literal: true

## module to display all text
module Display
  def ask_player_name
    puts "What's your name, Player?"
  end

  def game_options
    puts "Select difficulty level. \n
        1 - Easy  2 - Medium  3 - Difficult"
  end

  def mode_selection
    puts "Do you want to be the Code Maker, or the Code Breaker? \n
      1 - Code Maker  2 - Code Breaker"
  end

  def start_game
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
    [   ][ X ][   ][ X ][ O ]"
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

  def player_name
    ask_player_name
    name = gets.chomp
    puts "Welcome to Mastermind, #{name}!"
    name
  end

  def game_mode
    mode_selection
    choice = gets.chomp.to_i
  end
end

## Where the game takes place
class Game
  include Display
  include GameSetup

  attr_accessor :turns

  def initialize
    @player = Player.new(player_name, game_mode)
    @computer = Computer.new
    start_game
    level = game_options
    @turns = game_level(level)

  end
end

# #This is the human player. Can be codemaker or breaker
class Player
  attr_accessor :name

  def initialize(name, mode)
    @name = name
    @mode = role(mode)
  end

  def role(choice)
    choice == 1 ? "CM" : "CB"
  end
end

## Computer player. Can create codes and make guesses
class Computer
  def initialize
  end
end

## each turn will take place here
class Round
end

## Logic module for computer guesses, eventually
module Logic
end

## This is the module to evalute codes/guesses and give feedback
class Feedback
end

## This is the code and guesses. I'm not sure if I really need this yet.
class Code
  def initialize; end
end

Game.new
