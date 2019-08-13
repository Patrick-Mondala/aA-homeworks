class SluggishOctopus

    def get_longest_fish(fish)
        SluggishOctopus.bubble_sort(fish).last
    end

    # Bubble Sort: O(n^2)
    def self.bubble_sort!(array)
        len = array.length - 1
        sorted = false

        until sorted
        sorted = true
        (0...len).each do |idx|
            if array[idx].length > array[idx + 1].length
            array[idx], array[idx + 1] = array[idx + 1], array[idx]
            sorted = false
            end
        end
        end

        array
    end

    def self.bubble_sort(array)
        bubble_sort!(array.dup)
    end

end

sluggish_octopus = SluggishOctopus.new
p sluggish_octopus.get_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])