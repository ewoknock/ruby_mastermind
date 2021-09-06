require_relative 'display.rb'
require_relative 'input.rb'

class Game
    include Display
    include Input
    attr_reader :board, :game_mode, :max_guesses, :setter, :breaker, :code
    attr_accessor :turn, :game_end

    def initialize
        @board = Board.new()
        puts intro
    end

    def play_game
        setup_game
        @board = Board.new(rows: @max_guesses, code: @code)
        @turn = -1
        loop do 
            next_turn
            clear_screen
            break if game_over?#@turn == @max_guesses - 1 || board.answer_found?(@turn - 1)
        end
        puts @board
        puts messages(@game_end)
        if continue?
            play_game
        else
            puts messages("end")
        end
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
    end

    def game_over?
        if board.answer_found?(@turn)
            @game_end = "win"
            return true
        end
        if @turn == @max_guesses - 1 && !board.answer_found?(@turn)
            @game_end = "lose"
            return true
        end
        false
    end

    def continue?
        yes_no(messages('again')) == 'y'
    end


end
