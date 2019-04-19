class MaxIntSet
  
  def initialize(max)
    @max = max
	@store = Array.new(max)
  end

  def insert(num)
	raise "Out of bounds" if num >= @max || num < 0
    @store[num] = true
  end

  def remove(num)
	raise "Out of bounds" if num >= @max || num < 0
	@store[num] = false
  end

  def include?(num)
    @store[num] ? true : false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    arr = self[num] 
	arr.delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
	unless self.include?(num)
		self[num] << num 
		resize! if (@count + 1) > @store.size
		@count += 1
	end
  end

  def remove(num)
	bucket = self[num]
	@count -= 1 if bucket.include?(num)
	bucket.delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
	n = count * 2
	new_store = Array.new(n) {Array.new}
	
	@store.each do |bucket|
		bucket.each do |ele|
			new_store[ele % n] << ele
		end
	end
	
	@store = new_store
  end
end
