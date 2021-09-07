class Computer
    attr_reader :colors, :guess, :guess_index
    attr_accessor :turn

    def initialize
        @colors = %w[red yellow green cyan blue purple]
        @guess = %w[red red red red]
        @guess_index = 0
    end

    def set_code
        code = []
        4.times {code.push(colors.sample)}
        code
    end

    def make_guess(board, turn)
        unless turn == 0
            key = board.get_row(turn - 1)[:keys]
            key.each_with_index do |key, index|
                unless key == "red"
                    @guess[index] = @colors[guess_index]
                end
            end
            puts "Thinking..."
            sleep(0.5)
        end
        @guess_index += 1
        guess.clone 
    end
end