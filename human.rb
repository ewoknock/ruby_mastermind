class Human
    include Input
    def set_code
        get_code(messages('code'))
    end

    def make_guess(board, turn)
       get_guess(messages("guess"))
    end
end