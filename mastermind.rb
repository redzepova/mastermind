# frozen_string_literal: true

require_relative 'feedback'
require_relative 'human_codebreak'
require_relative 'game_setup'
require_relative 'display'
require_relative 'code'
require_relative 'game'

Game.new.play_game
