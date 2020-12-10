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
        it "should accept an array as arg" do 
            expect{[-1,0,2,-2,1].twosum}.not_to raise_error
        end
        it "should return the indices that add up to zero" do 
            expect([-1,0,2,-2,1].twosum).to eq([[0,4],[2,3]])
        end
    end

    describe "#my_transpose" do 
        it "transposes a matrix" do 
            matrix = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
            ]
            expect(matrix.my_transpose).to eq([
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
            ])

        end
    end
end