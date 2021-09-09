module Display
  TOP_LEFT = "\u2554"
  TOP_RIGHT = "\u2557"
  BOTTOM_LEFT = "\u255a"
  BOTTOM_RIGHT = "\u255d"
  HOR = "\u2550"
  VER = "\u2551"
  T_DOWN = "\u2566"
  T_UP = "\u2569"
  T_RIGHT = "\u2560"
  T_LEFT = "\u2563"
  T_ALL = "\u256c"

  def top_row
    TOP_LEFT + HOR * 9 + T_DOWN + HOR * 9 + TOP_RIGHT
  end

  def middle_row
    T_RIGHT + HOR * 9 + T_ALL + HOR * 9 + T_LEFT
  end

  def bottom_row
    BOTTOM_LEFT + HOR * 9 + T_UP + HOR * 9 + BOTTOM_RIGHT
  end

  def display_row(guesses, keys)
    guesses = guesses.map { |str| get_guess(str)}
    keys = keys.map { |str| get_key(str)}
    "#{VER} #{guesses.join(' ')} #{VER} #{keys.join(' ')} #{VER}"
  end

  def get_guess(color = 'empty')
    {
      'empty' => "\u25ef",
      'red' => "\u2b24".red,
      'green' => "\u2b24".green,
      'blue' => "\u2b24".blue,
      'yellow' => "\u2b24".yellow,
      'purple' => "\u2b24".purple,
      'cyan' => "\u2b24".cyan
    }[color]
  end

  def get_key(color = 'empty')
    {
      'empty' => "\u25cb",
      'used' => "\u25cc",
      'red' => "\u25cf".red,
      'white' => "\u25cf".white
    }[color]
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def intro
    <<~HEREDOC
      #{'Welcome to Mastermind!'.bold.underline.italic}

      Mastermind is a code-breaking game between two players:
      - The code #{'BREAKER'.red.bold}
      - The code #{'SETTER'.green.bold}

      The code #{'SETTER'.red.bold} sets the code, which is a sequence of four 
      colors, chosen from the following:
      - #{'Red'.bold.red}, #{'Yellow'.bold.yellow}, #{'Green'.bold.green}, #{'Cyan'.bold.cyan}, #{'Blue'.bold.blue}, #{'Purple'.bold.purple}

      The code #{'BREAKER'.red.bold} attempts to guess the code in the number of turns 
      specified when starting a game. After each guess, the setter will give you four #{'clues'.bold}
      to provide hints. A #{'white'.bold.white} clue indicates the guess contains a correct
      color in the wrong position, while a #{'red'.bold.red} clue means a correct color AND position.

      Below is a sample game:

      #{'Code:'.bold.underline}
      #{Board.new(rows: 1,board: [{ guess: %w[red purple purple blue],
                                          keys: %w[empty empty empty empty] }])}

      #{'Gameplay:'.bold.underline}
      #{Board.new(rows: 5, board: [{guess: %w[red red blue blue],
                                          keys: %w[red used used red] },
                                      { guess: %w[red red green green],
                                          keys: %w[red used used used] },
                                      { guess: %w[red yellow blue yellow],
                                          keys: %w[red used white used] },
                                      { guess: %w[red purple purple blue],
                                          keys: %w[red red red red] },
                                      { guess: %w[empty empty empty empty],
                                          keys: %w[empty empty empty empty] }])}

      This program has two game modes:
      - 1: Play as the code #{'BREAKER'.red.bold}, and try to guess a randomly generated code.
      - 2: Play as the code #{'SETTER'.green.bold}, and try to fool the computer's algorithm!
              (Note, the algorithm will likely win in 5 turns on average)

    HEREDOC
  end
end
