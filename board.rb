class Board
    include Display
    attr_reader :rows, :code, :board

    def initialize(rows: 12, board: empty_board(rows), code: Array.new(4, 'red'))
        @rows = rows
        @board = board
        @code = code
    end

    def empty_board(rows)
        Array.new(rows) {create_row[0]}
    end

    def create_row(guess = Array.new(4, 'empty'), keys = Array.new(4, 'empty'))
        [{guess: guess, keys: keys}]
    end

    def to_s
        rows = board
                .map{|row| display_row(row[:guess], row[:keys])}
                .join("\n" + middle_row + "\n")
        top_row + "\n" + rows + "\n" + bottom_row
    end

    def process_guess(turn, guess)
        board[turn][:guess] = guess
        binding.pry
    end

end
