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
        update_key(turn, guess)
    end

    def update_key(turn, guess)
        keys = Array.new(4, "used")
        code_count = Hash.new(0)
        code.each {|key| code_count[key] += 1}
        guess_count = Hash.new(0)
        guess.each {|guess| guess_count[guess] += 1}
        binding.pry
        code.each_with_index do |color, index|
            if(code_count[guess[index]] > 0)
                if(guess[index] == code[index])
                    keys[index] = "red"
                    code_count[guess[index]] -= 1
                elsif code.include?(guess[index])
                    unless guess_count[guess[index]] > code_count[guess[index]]
                        keys[index] = "white"
                        code_count[guess[index]] -= 1
                    end
                end
            end
            guess_count[guess[index]] -= 1
        end
        board[turn][:keys] = keys
    end

    def answer_found?(turn)
        board[turn][:keys].all? {|word| word == "red"}
    end
end
