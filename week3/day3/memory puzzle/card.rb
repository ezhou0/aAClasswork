#A Card has two useful bits of information: its face value, and whether it is face-up or face-down.
# You'll want instance variables to keep track of this information. You'll also want a method to display
# information about the card: nothing when face-down, or its value when face-up. I also wrote 
#hide, #reveal, #to_s, and #== methods.

# Common problem: Having issues with #hide and #reveal? Try testing small.

#boolean method for face up or face-down
#print method that depends on the boolean (print whether face-up, else print nothing)

class Card
    VALUES = (0..9)

    def self.pairvalues(num_pairs) ##takes in an integer
        # @value = rand(0..9).to_s
        values = VALUES
        cards = []
        while cards.length != num_pairs*2
            x = rand(values)
            if !cards.include?(x.to_s)
                cards << x.to_s
                cards << x.to_s
                p cards
            end
        end

        #have the number of pairs we need
        #put the random values into an array, multiply each value in the array by two, so we get a pair
        #once all pairs are in the array, we shuffle the array so that placement is random
        # [1,1,2,2,3,3,4,4] <randomized
        cards.shuffle!
        # p cards
        cards.map {|val| self.new(val)}
    end

    #decides pairs class method
    #returns an array of values in pairs <<this gets called by populate

    attr_reader :value , :revealed
    attr_accessor :revealed
    def initialize(value, revealed=false) #dont need to pass revealed because it will start at hidden
        @value = value
        @revealed = revealed
    end

    def hide #facedown
        @revealed = false
    end

    def reveal #faceup
        @revealed = true
    end

    def to_s
        
    end

    def ==(element)
        #return true or false
        #if element is of the same class and also element has the same value
        element.is_a?(self.class) && element.value == @value
    end
end

card = Card.new(8)
p Card.pairvalues(2)