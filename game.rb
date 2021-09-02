require_relative 'display.rb'
require_relative 'input.rb'

class Game
    include Display
    include Input
    attr_reader :board, :game_mode, :max_guesses, :setter, :breaker, :code
    attr_accessor :turn

    def initialize
        @board = Board.new()
        puts intro
    end

    def play_game
        setup_game
        @board = Board.new(rows: @max_guesses, code: @code)
        @turn = -1
        next_turn
    end

    private 

    def setup_game
        @game_mode = get_int_between(messages("mode"), 1, 2)
        puts @game_mode 
        @max_guesses = get_int_between(messages("max_guesses"), 1, 20)
        @breaker = @game_mode == 1 ? Human.new : Computer.new
        @setter = @game_mode == 2 ? Human.new : Computer.new
        @code = @setter.set_code
        clear_screen
    end

    def next_turn
        @turn += 1
        puts @board
        guess = breaker.make_guess()
        board.process_guess(turn, guess)
        puts @board
    end

end
