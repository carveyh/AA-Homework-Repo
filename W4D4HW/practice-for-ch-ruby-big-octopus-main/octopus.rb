require "byebug"

fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

def sluggish_octo(fish_arr)
	longest_fish = nil
	fish_arr.each do |fish1|
		fish_arr.each do |fish2|
			fish1.length > fish2.length ? longest_fish = fish1 : longest_fish = fish2
		end
	end
	longest_fish
end

p "sluggish #{sluggish_octo(fish_arr)}"

def dominant_octo(fish_arr)
	result = octo_sort(fish_arr)
	result.last
end

def octo_sort(fish_arr)
	return fish_arr if fish_arr.length <= 1
	midpoint = fish_arr.length / 2
	left = fish_arr[0...midpoint]
	right = fish_arr[(midpoint + 1)..-1]
	# debugger
	octo_merge(octo_sort(left), octo_sort(right))
end

def octo_merge(fish_arr1, fish_arr2)
	merged = []
	until fish_arr1.empty? || fish_arr2.empty?
		# debugger
		if(fish_arr1.first.length <=> fish_arr2.first.length) == 1
			merged << fish_arr2.shift
		else
			merged << fish_arr1.shift
		end
	end
	merged + fish_arr1 + fish_arr2
end

p "dominant #{dominant_octo(fish_arr)}"

def clever_octo(fish_arr)
	fish_arr.inject{|acc, fish| acc.length > fish.length ? acc : fish }
end

p "clever #{clever_octo(fish_arr)}"

###DANCING OCTOPUS

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]


def slow_dance(move, tiles_array)
	tiles_array.each_with_index{ |tile, idx| return idx if tile == move }
end

p "slow dance 'up': #{slow_dance("up", tiles_array)}"
p "slow dance 'right-down': #{slow_dance("right-down", tiles_array)}"

tiles_hash = {
	"up"=>0, 
	"right-up"=>1, 
	"right"=>2,
	"right-down"=>3,
	"down"=>4,
	"left-down"=>5,
	"left"=>6,
	"left-up"=>7
}

def fast_dance(move, new_tiles_data_structure)
	new_tiles_data_structure[move]
end

p "fast dance 'right-down': #{fast_dance("right-down", tiles_hash)}"