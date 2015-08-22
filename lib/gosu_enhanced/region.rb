require 'forwardable'

module GosuEnhanced
  # Hold a rectangular region specified by a Point and a Size
  # Most functions are delegated to the constituent Point and Size
  class Region
    extend Forwardable

    def_delegators :@position, :move_by!, :move_to!, :x, :y
    def_delegators :@size, :inflate!, :deflate!, :width, :height

    # Top left corner
    attr_reader :position
    # Overall Width and Height
    attr_reader :size

    # Create a new region with specified +pos+ as top left corner and +size+
    # as width and height
    def initialize(pos, size)
      @position = pos.dup
      @size = size.dup
    end

    # Return whether the region contains the specified +row+ and +col+
    def contains?(col, row = nil)
      return contains_point?(col) if col.respond_to? :x

      col.between?(left, left + width - 1) &&
        row.between?(top, top + height - 1)
    end

    # Return the topmost co-ordinate
    def top
      position.y
    end

    # Return the leftmost co-ordinate
    def left
      position.x
    end

    # It is necessary to override dup to produce an actual duplicate.
    def dup
      Region.new(position, size)
    end

    # Draw a rectangle on the specified +surface+ at the specified +z_order+
    # and with the specified +colour+
    def draw(surface, z_order, colour)
      surface.draw_rectangle(position, size, z_order, colour)
    end

    # Return a string representation of the region's position and size
    def to_s
      "<GosuEnhanced::Region: #{position}, #{size}>"
    end

    private

    # NODOC
    def contains_point?(pt)
      pt.x.between?(left, left + width - 1) &&
        pt.y.between?(top, top + height - 1)
    end
  end
end
