# frozen_string_literal: true

require_relative 'display'
require_relative 'game_setup'
require_relative 'feedback'
require_relative 'human_codebreak'

# Where the game takes place

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
    guess = @mode.make_guess.code
    if guess == @master_code
      winner_text
    else
      feedback = Feedback.new(guess, @master_code)
      matches = feedback.find_exact_matches
      near_matches = feedback.find_near_matches
      display_feedback(matches, near_matches)
      @turns += -1
    end
  end

  def play_game
    @mode.make_guess
    play_round until @mode.guess.code == @master_code.code || @turns.zero?
  end
end
