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
    end
  
    def play_again?
      Game.new.play_game
    end
end  