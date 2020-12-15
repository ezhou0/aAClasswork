class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count, :store, :start_idx

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @start_idx = 0
  end

  def [](i)
    if i >= self.count
      return nil
    elsif i < 0
      return nil if i < -self.count
      return self[self.count + i]
    end

    self.store[(self.start_idx + i)%capacity]
  end

  def []=(i, val)

    if i >= self.count
      (i - self.count).times {push(nil)}
      # puts "inside if #{self}" #we go past the count, so we have to reset however many pass to nil
    elsif i < 0
      return nil if i < -self.count
      return self[self.count + i] = val
      # puts "inside ifelse #{self}"
    end
    # puts "before i == #{self}"
    # puts self.count

    if i == self.count
     resize! if capacity == self.count
     self.count +=1
    end
    
    # puts "after i == #{self}"
    # [1,2,3][4] 4 == index 3


    self.store[(self.start_idx+i)%capacity] = val
    puts "after =val #{self}"
  end

  def capacity
    @store.length
  end

  def include?(val)
    any? {|ele| ele == val}
  end

  def push(val)
    resize! if capacity == self.count
    self.store[(self.start_idx + self.count) % capacity] = val
    self.count += 1
    self
  end

  def unshift(val)
    resize! if capacity == self.count
    self.start_idx = (start_idx - 1)%capacity
    self.store[self.start_idx] = val
    self.count += 1
    self
  end

  def pop
    return nil if self.count == 0
    last_item = self.store[(self.start_idx + self.count - 1)%capacity]
    self.count -= 1
    last_item
  end

  def shift
    return nil if self.count == 0
    first_item = self.store[self.start_idx]
    self.start_idx = self.start_idx+1
    self.count -= 1
    first_item
  end

  def first
    return nil if self.count == 0
    self.store[self.start_idx]
  end

  def last
    return nil if self.count == 0
    self.store[(self.start_idx+self.count-1)%capacity]
  end

  def each
    self.count.times {|i| yield self[i]}
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    return false unless length == other.length
    each_with_index {|el,i| return false unless el == other[i]}
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(capacity*2)
    each_with_index{|el, i| new_store[i] = el}
    self.store = new_store
    self.start_idx = 0
  end
end
