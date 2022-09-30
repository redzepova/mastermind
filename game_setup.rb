# frozen_string_literal: true

require_relative 'display'
require_relative 'human_codebreak'
require_relative 'code'
require_relative 'computer_codebreak'
## Game set-up functions, gets player, basic game info
module GameSetup
  include Display

  def game_level(level)
    case level
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
    mode = gets.chomp.to_i
    game_mode unless [1, 2].include?(mode)
    mode == 1 ? ComputerCodebreak.new : HumanCodeBreak.new
  end

  def play_again?
    Game.new.play_game
  end
end
