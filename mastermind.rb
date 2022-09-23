# frozen_string_literal: true
class Computer
end

module Display
  def get_player_name()
    puts "What's your name, Player?"
  end
  def game_options()
    puts "Select difficulty level. \n
        1 - Easy  2 - Medium  3 - Difficult"
  end
  def start_game()
    puts "Would you like to see the game rules before we start? Y/N"
    answer = gets.chomp
    game_rules(answer)
  end
  def game_rules(a)
    if a == "Y" 
      puts "Mastermind is a guessing game. One player chooses a code. The other player must guess that code
    within the specified number of turns.
    
    Each code is 5 numbers long, and each number can be between 1-6. Numbers may repeat."
    end
  end
end

module GameSetup
  include Display

  def get_difficulty()
    game_options()
    difficulty = gets.chomp
  end
  def player_name()
    get_player_name
    name = gets.chomp
    puts "Welcome to Mastermind, #{name}!"
    return name
  end
end

class Game
  include Display
  include GameSetup

  attr_accessor :difficulty

  def initialize ()
    @player = Player.new(player_name)
    start_game()
    @difficulty = get_difficulty
  end
end

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

module Logic
end

class Feedback
end

class Code
  def initialize; end
end



game = Game.new
