class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all?{ |char| Code::POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(length)
    pegs = Array.new(length){ Code::POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def pegs
    @pegs
  end

  def initialize(pegs)
    raise if !Code.valid_pegs?(pegs)
    @pegs = pegs.map{ |peg| peg.upcase}
  end

  def[](indx)
    @pegs[indx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each {|i| count+=1 if @pegs[i] == guess[i]}
    count
  end

  #guess [a,b,b,a]
  #pegs [b,a,b,c]

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if @pegs.include?(guess[i]) && !(@pegs[i] == guess[i])
        count+=1
      end
    end
    count
  end

  def ==(other)
    self.length == other.length && self.num_exact_matches(other) == self.length
  end



end
