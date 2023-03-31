class Calculator

	attr_reader :multiplier, :position_on_desk, :color

	def initialize(color = nil)
		@multiplier = 1
		@position_on_desk = [0,0]
		@color = color
	end

	def move_calc_up_on_desk
		@position_on_desk[1] += 1
		position_on_desk
	end

	def activate_hidden_multiplier
		@multiplier = 5
	end

	def add(a, b)
		(a + b) * multiplier
	end

	def sum_arr(arr)
		arr.sum
	end

	private
	def just_give_1000
		1000
	end

	def self.just_give_class_10000
		10000
	end
end

class ScientificCalc < Calculator
	
	def can_i_has_1000
		self.just_give_1000
	end
end