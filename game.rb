require_relative 'display.rb'

class Game
    include Display
    attr_reader :board

    def initialize
        @board = Board.new()
    end

    def play_game
        puts intro
    end

end
