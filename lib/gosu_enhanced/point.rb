# Module for gosu_enhanced gem.
module GosuEnhanced
  # Hold a (x, y) pixel position, and allow for offsetting and movement
  Point = Struct.new(:x, :y) do
    def offset(by_x, by_y = nil)
      dup.move_by!(by_x, by_y)
    end

    # Negative co-ordinates are allowed.

    def move_by!(by_x, by_y = nil)
      return move_by_point(by_x) if by_x.respond_to? :x
      return move_by_size(by_x)  if by_x.respond_to? :width

      self.x += by_x
      self.y += by_y

      self
    end

    def move_to!(new_x, new_y = nil)
      return move_to_point(new_x) if new_x.respond_to? :x

      self.x = new_x
      self.y = new_y

      self
    end

    private

    def move_by_point(pt)
      self.x += pt.x
      self.y += pt.y

      self
    end

    def move_by_size(sz)
      self.x += sz.width
      self.y += sz.height

      self
    end

    def move_to_point(pt)
      self.x = pt.x
      self.y = pt.y

      self
    end
  end

  # Utility function to construct a Point
  #
  # * +x+   x co-ordinate
  # * +y+   y co-ordinate

  def Point(x, y)
    Point.new(x, y)
  end

  module_function :Point
end
