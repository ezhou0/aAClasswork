class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    each_with_index.inject(0) do |something ,(el,i)|
      (el.hash * i) ^ something
    end
  end
end

class String
  def hash
    split("").map{|char|char.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.hash
  end
end
