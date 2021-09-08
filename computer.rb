class Computer
    attr_reader :colors, :guess, :guess_index
    attr_accessor :turn

    def initialize
        @colors = %w[red yellow green cyan blue purple]
        @guess = %w[red red yellow yellow]
        @guess_index = 2
    end

    def set_code
        code = []
        4.times {code.push(colors.sample)}
        code
    end

    def make_guess(board, turn)
        unless turn == 0
            key = board.get_row(turn - 1)[:keys]
            saved = nil

            color_count = 0

            new_guess = @guess.clone
            key.each_with_index do |key, index|
                if key == "white"
                    #binding.pry

                    not_inserted = true
                    next_index = (index + 1) % 4
                    check = 0
                    while not_inserted && check < 4
                        if @guess[next_index] == "used" || new_guess[next_index] != @guess[index]
                            unless @guess[next_index] == @guess[index]
                                new_guess[next_index] = @guess[index]
                                not_inserted = false
                            end
                        end
                        next_index = (next_index + 1) % 4
                        check += 1
                    end
                end
            end

            @guess = new_guess.clone


            key.each_with_index do |key, index|
                if key == "used"
                    #binding.pry
                    if @colors.include?(@guess[index])
                        @colors.delete(@guess[index])
                        @guess_index -= 1
                    end
                    @guess[index] = @colors[@guess_index]
                    color_count += 1
                    if color_count == 2 && turn <= 3
                        @guess_index = (@guess_index + 1) % @colors.length

                        color_count = 0
                    end
                end
            end

            @guess_index = (@guess_index + 1) % @colors.length
=begin
            key.each_with_index do |key, index|
                unless key == "red"
                    if key == "white"
                        binding.pry
                        if saved.nil?
                            saved = @guess[index]
                        elsif @guess[index] != saved 
                            @guess[index], saved = saved, @guess[index]
                            next
                        end
                    end
                    @guess[index] = @colors[guess_index]
                    color_count += 1
                    if color_count == 2
                        @guess_index += 1
                        if @guess_index > 5
                            @guess_index = 0
                        end
                        color_count = 0
                    end
                end
            end
=end
            puts "Thinking..."
            sleep(0.5)
        end
        #@guess_index += 1
        @guess.clone 
    end
end