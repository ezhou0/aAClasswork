class Hanoi
    attr_reader :disks, :towers
    def initialize(disks=7, towers = nil)
        @disks = disks
        towers.nil? ? @towers = create_towers(disks) : @towers = towers
    end

    # towers are indicies
    def move(tower1, tower2)     
        start_pos, end_pos = towers[tower1], towers[tower2]
        raise "Empty tower!!" if start_pos.empty? 
        if end_pos.empty?
            end_pos << start_pos.pop
        elsif end_pos[-1] > start_pos[-1]
            end_pos << start_pos.pop
        else
            raise "Invalid move!!"
        end
        towers
    end

    private
    def create_towers(disks)
        towers = Array.new(3) {Array.new}
        (1..disks).each {|disk| towers.sample << disk}
        towers.map {|tower| tower.sort.reverse}
    end
end

hanoi = Hanoi.new(3, [[3],[2,1],[]])
p hanoi.towers