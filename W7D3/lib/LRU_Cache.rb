class LRUCache
    def initialize(size)
        raise "not a valid size" unless size.is_a?(Integer)
        @size = size
        @queue = []
        @hash = {}
    end

    def count
        # returns number of elements currently in cache
        hash.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        if count < size && !hash.include?(el)
            add_to_queue_and_hash(el)
        elsif count <= size && queue.include?(el)
            @queue.delete(el)
            queue << el
        else
            delete(queue.shift)
            add_to_queue_and_hash(el)
        end
    end

    def delete(el)
        @queue.delete(el)
        @hash.delete(el)
    end

    def add_to_queue_and_hash(el)
        queue << el
        hash[el] = el.hash
    end

    def show
        # shows the items in the cache, with the LRU item first
        p queue
    end

    private
    # helper methods go here!
    attr_reader :size
    attr_accessor :hash, :queue
end

# johnny_cache.add([1,2,3])
# johnny_cache.add(5)
# johnny_cache.add(-5)
# johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.add([1,2,3,4])
# johnny_cache.add("I walk the line")
# johnny_cache.add(:ring_of_fire)
# johnny_cache.add("I walk the line")
# johnny_cache.add({a: 1, b: 2, c: 3})


# johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
