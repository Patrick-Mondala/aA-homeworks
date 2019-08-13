class CleverOctopus
    def get_longest_fish(fish)
        fish.inject {|longest_fish, current_fish| current_fish.length > longest_fish.length ? current_fish : longest_fish}
    end
end

clever_octopus = CleverOctopus.new
p clever_octopus.get_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])