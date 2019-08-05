class Map
    def initialize
      @map = []
    end

    def set(key, value)
      map.push([key, value])
    end

    def get(key)
      map.each {|pair| return pair.last if pair.first == key}
      nil
    end

    def delete(key)
      map.each {|pair| map.delete(pair) if pair.first == key}
    end

    def show
      map.dup
    end

    :private
    attr_reader :map
end