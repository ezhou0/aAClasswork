require 'rspec'
require 'hanoi'

describe Hanoi do
    subject(:hanoi) {Hanoi.new(8)}
    let(:sort){Proc.new{|arr| arr == arr.sorted.reverse}}
    describe "initialize" do 
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

end