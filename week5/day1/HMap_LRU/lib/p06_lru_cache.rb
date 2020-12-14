require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_accessor :map, :store
  attr_reader :max, :prc
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if map[key]
      node = map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = self.prc.call(key)
    new_node = @store.append(key,value)
    map[key] = new_node
    eject! if count > self.max
    value
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    map[node.key] = @store.append(node.key, node.val)
  end

  def eject!
    removed = @store.first
    removed.remove #removed node from list
    map.delete(removed.key) #removed from map
  end
end
