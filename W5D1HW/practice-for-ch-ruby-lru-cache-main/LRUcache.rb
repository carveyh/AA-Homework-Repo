class LRUCache

	attr_reader :capacity

	def initialize(capacity)
		@capacity = capacity
		@underlying_cache = []
	end

	def count
		@underlying_cache.length
	end

	def add(el)
		prev_idx = @underlying_cache.index(el)
		if prev_idx.nil?
		#If not already in cache, add and enforce capacity if needed.
			@underlying_cache.shift if full?
			@underlying_cache << el
		else
		#If already in cache, extract it and bring it to the most recent end.
			move_to_front(prev_idx)
		end
	end

	def show
		p @underlying_cache
	end

	private
	# helper methods go here!

	def full?
		self.count == self.capacity
	end

	def move_to_front(idx)
		@underlying_cache = @underlying_cache[0...idx] + @underlying_cache[(idx + 1)..-1] + [@underlying_cache[idx]]
	end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]