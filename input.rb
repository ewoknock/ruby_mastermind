module Input
  VALID_GUESSES = %w[r R y Y g G c C b B p P]

  def messages(msg)
    {
      'mode' => 'Please select your desired game mode (1: BREAKER, 2: SETTER): ',
      'max_guesses' => 'How many guesses would you like? (Maximum of 20 guesses): ',
      'guess' => "Please enter your guesses with a space between them (i.e. 'r g b p' for 'red green blue purple'): ",
      'code' => "Please enter the code (e.g. 'r g b p' for 'red green blue purple'): ",
      'win' => "Congratulations! You've successfully cracked the code!",
      'lose' => 'Sorry, you lost :(',
      'again' => 'Would you like to play again? (y/n): ',
      'end' => 'Thanks for playing!'
    }[msg]
  end

  def get_int_between(message, min, max)
    print message
    int = gets.chomp.to_i
    until int >= min && int <= max
      puts "Number must be between #{min} and #{max}"
      print message
      int = gets.chomp.to_i
    end
    int
  end

  def get_guess(message)
    print message
    guess = gets.chomp.split(' ')
    until (guess - VALID_GUESSES).empty? && guess.length == 4
      unless (guess - VALID_GUESSES).empty?
        puts "#{guess.join(' ')} is not a valid guess."
      else
        puts 'please enter 4 guesses in one line'
      end
      print message
      guess = gets.chomp.split(' ')
    end 
    format_color(guess)
  end

  def get_code(message)
    print message
    code = gets.chomp.split(' ')
    until (code - VALID_GUESSES).empty? && code.length == 4
      unless (code - VALID_GUESSES).empty?
        puts "#{code.join(' ')} is not a valid code."
      else
        puts 'please enter 4 colors in one line'
      end
      print message
      code = gets.chomp.split(' ')
    end 
    format_color(code)
  end

  def format_color(guess)
    guess.each_with_index do |color, i|
      guess[i] = {
        'r' => 'red',
        'b' => 'blue',
        'g' => 'green',
        'p' => 'purple',
        'c' => 'cyan',
        'y' => 'yellow'
      }[color.downcase]
    end
    guess
  end

  def yes_no(message)
    print message
    response = gets.chomp
    until %w[y Y n N].include? response
      puts "Please enter 'y' or 'n'."
      print message
      response = gets.chomp
    end
    response.downcase
  end
end
