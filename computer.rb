class Computer
    attr_reader :colors
    def initialize
        @colors = %w[red yellow green cyan blue purple]
    end
    def set_code
        code = []
        4.times {code.push(colors.sample)}
        code
    end
end