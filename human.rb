class Human
  include Input
  def set_code
    get_code(messages('code'))
  end

  def make_guess(_board, _turn)
    get_guess(messages('guess'))
  end
end
