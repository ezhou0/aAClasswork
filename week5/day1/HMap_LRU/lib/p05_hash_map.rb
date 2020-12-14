require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count, :store
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if self.count >= num_buckets
    if include?(key)
      bucket(key).update(key, val)
    else 
      bucket(key).append(key, val)
      @count += 1
    end 
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    self.count -=1 if bucket(key).remove(key)
  end

  def each
    self.store.each do |bucket|
      bucket.each { |node| yield [node.key, node.val]}
    end 
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = self.store
    self.count = 0 
    self.store = Array.new(num_buckets * 2) {LinkedList.new}
    old_store.each do |bucket|
      bucket.each { |node| set(node.key, node.val)}
    end 
  end

  def bucket(key)
    self.store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
