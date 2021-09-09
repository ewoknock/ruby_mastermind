class Computer
  attr_reader :colors, :guess, :guess_index
  attr_accessor :turn

  def initialize
    @colors = %w[red yellow green cyan blue purple]
    @wrong_guesses = {"red" => false, "yellow" => false, "green" => false, 
                        "cyan" => false, "blue" => false, "purple" => false}
    @guess = %w[red red yellow yellow]
    @guess_index = 2
    @color_count = 0
  end

  def set_code
    code = []
    4.times {code.push(colors.sample)}
    code
  end

  def make_guess(board, turn)
    unless turn.zero?
      keys = board.get_row(turn - 1)[:keys].clone
      new_guess = @guess.clone
      verify_valid_colors_remaining(keys)
      process_white_keys(keys, new_guess)
      process_used_keys(keys, new_guess, turn)
      @guess = new_guess.clone
      @guess_index = (@guess_index + 1) % @colors.length
      puts 'Thinking...'
      sleep(0.5)
    end
    @guess.clone
  end

  def verify_valid_colors_remaining(keys)
    keys.each_with_index do |key, index|
      if key == "used"
        @wrong_guesses[@guess[index]] = true
      end
    end

    @colors.each do |color| 
      if @wrong_guesses[color]
        @colors.delete(color) 
        @guess_index -= 1
      end
    end
  end

  def process_white_keys(keys, new_guess)
    keys.each_with_index do |key, index|
      if key == 'white'
        not_inserted = true
        next_index = (index + 1) % 4
        check = 0
        while not_inserted && check < 4
          if keys[next_index] != 'red' && new_guess[next_index] != @guess[index] &&
                                          @guess[next_index] != @guess[index]
            new_guess[next_index] = @guess[index]
            keys[index] = 'used'
            not_inserted = false
          end
          next_index = (next_index + 1) % 4
          check += 1
        end
      end
    end
  end

  def process_used_keys(keys, new_guess, turn)
    color_count = 0
    keys.each_with_index do |key, index|
      if key == "used"
        if new_guess[index] == guess[index]
          new_guess[index] = @colors[@guess_index]
          color_count += 1
        end
        if color_count == 2 && turn <= 3
          @guess_index = (@guess_index + 1) % @colors.length
          color_count = 0
        end
      end
    end
  end
end
