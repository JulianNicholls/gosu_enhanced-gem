module GosuEnhanced
  # Hold a (x, y) pixel position, and allow for offsetting and movement
  class Point < Struct.new( :x, :y )
    def offset( by_x, by_y = nil )
      if by_x.respond_to? :x
        Point.new( x + by_x.x, y + by_x.y )
      elsif by_x.respond_to? :width
        Point.new( x + by_x.width, y + by_x.height )
      else
        Point.new( x + by_x, y + by_y )
      end
    end

    # Negative co-ordinates are allowed.

    def move_by!( by_x, by_y = nil )
      if by_x.respond_to? :x
        self.x += by_x.x
        self.y += by_x.y
      elsif by_x.respond_to? :width
        self.x += by_x.width
        self.y += by_x.height
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
