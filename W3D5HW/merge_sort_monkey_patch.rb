#Circle Time Prompt: Monkey Patch Array#merge_sort with helper Array::merge

class Array

	def self.merge(arr1, arr2)
		merged = []
		until arr1.empty? || arr2.empty?
			if (arr1.first <=> arr2.first) == 1
				merged << arr2.shift
			else
				merged << arr1.shift
			end
		end
		merged + arr1 + arr2
	end

	def merge_sort
		return self if self.length <= 1
		mid = self.length / 2
		left = self[0...mid]
		right = self[mid..-1]
		Array.merge(left.merge_sort, right.merge_sort)
	end

end