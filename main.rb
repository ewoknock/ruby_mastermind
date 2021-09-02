require_relative 'formatting.rb'
require_relative 'game.rb'
require_relative 'display.rb'
require_relative 'input.rb'
require_relative 'board.rb'
require_relative 'computer.rb'
require_relative 'human.rb'
require 'pry-byebug'

Game.new.play_game
