class Card
    SUITS = {
    :spade => "",
    :heart => "",
    :club => "",
    :diamond => ""
    }
    VALUES = {
        :two => "2",
        :three =>"3",
        :four =>"4",
        :five=>"5",
        :six=>"6",
        :seven=>"7",
        :eight=>"8",
        :nine=>"9",
        :ten=>"10",
        :jack =>"J",
        :queen=>"Q",
        :king =>"K",
        :ace=>"A"
    }
    attr_reader :suit, :card
    def initialize(suit, value)
        raise "not a real card" unless SUITS.include?(suit) && VALUES.include?(value)
        @suit = suit
        @value = value
    end

    #def inspect

        #returns value and suit of a card vs whole object


end