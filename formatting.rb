class String
    def red
        "\e[91m#{self}\e[0m"
    end

    def yellow
        "\e[93m#{self}\e[0m"
    end

    def green
        "\e[92m#{self}\e[0m"
    end

    def cyan
        "\e[96m#{self}\e[0m"
    end

    def blue
        "\e[94m#{self}\e[0m"
    end

    def purple
        "\e[95m#{self}\e[0m"
    end

    def white
        "\e[97m#{self}\e[0m"
    end

    def bold
        "\e[1m#{self}\e[22m"
    end

    def italic
        "\e[3m#{self}\e[23m"
    end

    def underline
        "\e[4m#{self}\e[24m"
    end
end