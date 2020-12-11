class Hanoi
    attr_reader :disks, :towers
    def initialize(disks=7, towers = nil)
        @disks = disks
        towers.nil? ? @towers = create_towers(disks) : @towers = towers
    end

    # towers are indicies
    def move(tower1, tower2)     
        start_pos, end_pos = towers[tower1], towers[tower2]
        if start_pos.empty?
            puts "Empty tower!!"
            #raise "Empty tower!!"
            return false
        end

        if end_pos.empty?
            end_pos << start_pos.pop
        elsif end_pos[-1] > start_pos[-1]
            end_pos << start_pos.pop
        else
            #raise "Invalid move!!"
            puts "Invalid move!!"
            return false
        end
        true
    end

    def won?
        towers.any? {|tower| tower.length == disks}
    end

    def play
        until won?
            render
            positions = getinput
            valid = move(positions[0],positions[1])
            until valid
                render
                puts "invalid move, input again"
                positions = getinput
                valid = move(positions[0],positions[1])
                
            end
        end
        puts "you won!"
    end

    def getinput
         puts "enter the tower you'd like to move a disk from"
        tower1 = gets.chomp.to_i
        puts "enter the tower you'd like to move a disk to"
        tower2 = gets.chomp.to_i
        return [tower1,tower2]
    end

    def render
        towers.each_with_index do |tower,i|
            puts "Tower #{i}"
            puts tower.reverse.join("\n")
            if tower.empty?
                puts "__"
            end
        end
    end

    private
    def create_towers(disks)
        towers = Array.new(3) {Array.new}
        (1..disks).each {|disk| towers.sample << disk}
        towers.map {|tower| tower.sort.reverse}
    end
end

hanoi = Hanoi.new(3, [[3],[2,1],[]])
hanoi.play