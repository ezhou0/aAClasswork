require 'array'
require 'rspec'



describe Array do 
    describe "#my_uniq" do
        it "should accept an array as an arg" do
            expect{[1,2,3].my_uniq}.not_to raise_error
        end
        it "should return an array of unique elements" do 
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        end
    end

    describe "#twosum" do 
        
    end 
end