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

  def start_game
    puts 'Would you like to see the game rules before we start? Y/N'
    answer = gets.chomp
    game_rules(answer)
  end

  def game_rules(ans)
    return unless ans == 'Y'

    puts "Mastermind is a guessing game. One player chooses a code. The other player must guess that code
within the specified number of turns.

Each code is 5 numbers long, and each number can be between 1-6. Numbers may repeat."
  end
end

## Game set-up functions, gets player, basic game info
module GameSetup
  include Display

  def game_mode(mode)
    turns = case mode
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
end

## Where the game takes place
class Game
  include Display
  include GameSetup

  attr_accessor :turns

  def initialize
    @player = Player.new(player_name)
    start_game
    mode = game_options
    @turns = game_mode(mode)
  end
end

# #This is the human player. Can be codemaker or breaker
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

## Computer player. Can create codes and make guesses
class Computer
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
