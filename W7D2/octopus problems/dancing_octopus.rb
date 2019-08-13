class DancingOctopus
    def slow_dance(direction, tiles_array)
        tiles_array.index(direction)
    end

    def fast_dance(direction, new_tiles_data_structure)
        new_tiles_data_structure[direction]
    end
end

dancing_octopus = DancingOctopus.new
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p dancing_octopus.slow_dance("up", tiles_array) # => 0
p dancing_octopus.slow_dance("right-down", tiles_array) # => 3
new_tiles_data_structure = {"up" => 0, 
"right-up" => 1, 
"right" => 2, 
"right-down" => 3, 
"down" => 4, 
"left-down" => 5, 
"left" => 6,  
"left-up" => 7}
p dancing_octopus.fast_dance("up", new_tiles_data_structure) # => 0
p dancing_octopus.fast_dance("right-down", new_tiles_data_structure) # => 3