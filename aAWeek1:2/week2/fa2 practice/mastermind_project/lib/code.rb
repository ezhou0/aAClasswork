class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all?{|char| POSSIBLE_PEGS.keys.include?(char.upcase)}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise"not valid pegs"
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    array = Array.new(length){Code::POSSIBLE_PEGS.keys.sample}
    Code.new(array)
  end

  def self.from_string(pegs)
    array = pegs.split("")
    Code.new(array)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i| 
      count +=1 if guess[i] == @pegs[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if @pegs.include?(guess[i])
    end
    count -= num_exact_matches(guess)
  end
  
  def ==(other)
    num_exact_matches(other) == @pegs.length && other.length == @pegs.length
  end
  
end
