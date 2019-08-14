require "rspec"
require "LRU_Cache"

describe LRUCache do
    subject(:lrucache) { LRUCache.new(4) }
    describe "#initialize" do
        it "raises an error if not given an integer argument" do
            expect { LRUCache.new("not an integer arg") }.to raise_error("not a valid size")
        end
        it "sets instance variable size to size argument passed to method" do
            expect(lrucache.send :size).to eq(4)
        end
        it "creates empty array instance variable queue" do
            expect(lrucache.send :queue).to eq([])
        end
        it "creates empty hash instance variable queue" do
            expect(lrucache.send :hash).to eq({})
        end
    end

    describe "#count" do
        it "returns number of elements currently in cache" do
            lrucache.add("I walk the line")
            lrucache.add(5)
            expect(lrucache.count).to eq(2)
        end
    end

    describe "#add" do
        it "becomes most recent (last) element in queue" do
            lrucache.add([1,2,3])
            queue = lrucache.send :queue
            expect(queue.last).to eq([1,2,3])
        end

        it "is added to hash with el as key and el.hash value as value" do
            array = [1,2,3]
            array_hash_id = array.hash
            lrucache.add(array)
            hash = lrucache.send :hash
            expect(hash[[1,2,3]]).to eq(array_hash_id)
        end

        it "removes old position in queue if already existed" do
            lrucache.add("I walk the line")
            lrucache.add([1,2,3])
            lrucache.add(5)
            lrucache.add([1,2,3])
            queue = lrucache.send :queue
            expect(queue[1]).to_not eq([1,2,3])
        end
    end

    describe "#show" do
        it "shows the items in the cache, with the LRU item first" do
            lrucache.add([1,2,3])
            lrucache.add(5)
            lrucache.add(-5)
            lrucache.add({a: 1, b: 2, c: 3})
            lrucache.add([1,2,3,4])
            lrucache.add("I walk the line")
            lrucache.add(:ring_of_fire)
            lrucache.add("I walk the line")
            lrucache.add({a: 1, b: 2, c: 3})
            expect(lrucache.show).to eq(lrucache.send :queue)
        end
    end
end