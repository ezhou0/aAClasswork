require 'card'
require 'rspec'
describe "initialize" do
    #make sure each card has a value and a suit
    #showable
    it "should accept a suit and value as arguments" do
        expect{Card.new(:spade,:jack)}.not_to raise_error
    end

    context "when an invalid suit or value are passed" do 
        it "should raise error, not a real card" do
            expect{Card.new(:spadee,:jackes)}.to raise_error("not a real card")
        end
    end


end

# describe ""
# #multiple syntactic sugar
# ==
# <=>

#def inspect
    #returns value and suit of a card vs whole object