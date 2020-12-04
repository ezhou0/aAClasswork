require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        print "Enter a code"
        code = Code.from_string(gets.chomp)
        self.print_matches(code)
        code == @secret_code

    end
end
