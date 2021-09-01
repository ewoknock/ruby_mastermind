require_relative 'formatting.rb'
require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'display.rb'
require 'pry-byebug'

def play
    game = Game.new
    game.play_game
end

play