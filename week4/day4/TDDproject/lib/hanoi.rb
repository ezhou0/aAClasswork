class Hanoi
    attr_reader :disks, :towers
    def initialize(disks=7)
        @disks = disks
        @towers = create_towers(disks)
    end

    private
    def create_towers(disks)
        towers = Array.new(3) {Array.new}
        (1..disks).each {|disk| towers.sample << disk}
        towers.map {|tower| tower.sort.reverse}
    end
end

# hanoi = Hanoi.new
# p hanoi.towers