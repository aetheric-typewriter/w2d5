class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
	num = 0
	self.each_with_index do |el, i|
		num += el.object_id * (10 ** i)
	end
	num.hash
  end
end

class String
  def hash
	chars = self.split("")
	alpha = ("a".."z").to_a
	nums = chars.map { |c| alpha.index(c) }
	nums.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
	0
	arr = []
	self.each do |k, v|
		arr << [k, v]
	end
	arr.sort.hash
  end
end
