module GosuEnhanced
  # Hold a (x, y) pixel position, and allow for offsetting and movement
  class Point < Struct.new( :x, :y )
    def offset( by_x, by_y = nil )
      if by_x.respond_to? :x
        Point.new( x + by_x.x, y + by_x.y )
      else
        Point.new( x + by_x, y + by_y )
      end
    end

    def move_by!( by_x, by_y = nil )
      if by_x.respond_to? :x
        self.x += by_x.x
        self.y += by_x.y
      else
        self.x += by_x
        self.y += by_y
      end
    end

    def move_to!( new_x, new_y = nil )
      if new_x.respond_to? :x
        self.x, self.y = new_x.x, new_x.y
      else
        self.x, self.y = new_x, new_y
      end
    end
  end
end
