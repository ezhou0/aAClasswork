require 'rspec'
require 'hanoi'

describe Hanoi do
    subject(:hanoi) {Hanoi.new(8)}
    let(:sort){Proc.new{|arr| arr == arr.sorted.reverse}}
    describe "#initialize" do 
        #initialize 3 piles of disks 
        #accepts n amount of total disks
        it "should accept a number of disks" do
            expect(hanoi.disks).to eq(8)
        end

        context "when no disks are passed" do 
            hanoi = Hanoi.new
            it "should initialize the 7 disks" do
                expect(hanoi.disks).to eq(7)
            end
        end

        it "should initialize 3 random towers" do
            expect(hanoi.towers.length).to eq(3)
        end

        it "should have all towers stacked correctly" do
            expect(hanoi.towers.all?(&:sort)).to be true
        end

        
        #all piles should be sortedreverse
        
    end

    describe "#move" do 
        #  valid moves
            # if tower is empty we can put it there
            # else last disk must be larger than current disk
                # if last disk is smaller than current disk than raise an error
            # can't move from an empty tower
        it "takes in two numbers representing towers" do 
            expect{hanoi.move(1,2)}.not_to raise_error
        end

        context "when adding to a tower" do 
            hanoi = Hanoi.new(3, [[3],[2,1],[]])  #need to overwrite init to accept default tower
            it "should not allow moves from empty tower" do 
                expect{hanoi.move(2, 1)}.to raise_error("Empty tower!!")
            end
            it "should always add to an empty tower" do 
                expect(hanoi.move(1,2)).to eq([[3],[2],[1]])
            end
            it "should always add to the tower if the last disk is larger" do 
                expect(hanoi.move(2,0)).to eq([[3,1],[2],[]])
            end
            it "should never add if the last disk is smaller" do 
                expect{hanoi.move(1,0)}.to raise_error("Invalid move!!")
            end
        end
    #     # it "should always add a disk to empty tower"
    end
end