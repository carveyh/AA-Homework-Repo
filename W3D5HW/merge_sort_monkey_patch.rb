#Circle Time Prompt: Monkey Patch Array#merge_sort with helper Array::merge
#V2: Update to accept a block utilizing <=> comparison

class Array

	def self.merge(arr1, arr2, &blk)
		blk ||= Proc.new { |ele1, ele2| ele1 <=> ele2 }
		merged = []
		until arr1.empty? || arr2.empty?
			# if (arr1.first <=> arr2.first) == 1
			if (blk.call(arr1.first, arr2.first)) == 1
				merged << arr2.shift
			else
				merged << arr1.shift
			end
		end
		merged + arr1 + arr2
	end

	def merge_sort(&blk)
		return self if self.length <= 1
		mid = self.length / 2
		left = self[0...mid]
		right = self[mid..-1]
		Array.merge(left.merge_sort(&blk), right.merge_sort(&blk), &blk)
	end

end

p [45,77,3,6,782,3,5,78,3,54,8,4,2,5,7,6].merge_sort { |ele1, ele2| ele1 % 5 <=> ele2 % 5 }
p [45,77,3,6,782,3,5,78,3,54,8,4,2,5,7,6].merge_sort { |ele1, ele2| ele1 <=> ele2 }
p [45,77,3,6,782,3,5,78,3,54,8,4,2,5,7,6].merge_sort { |ele1, ele2| ele2 <=> ele1 }
p [45,77,3,6,782,3,5,78,3,54,8,4,2,5,7,6].merge_sort