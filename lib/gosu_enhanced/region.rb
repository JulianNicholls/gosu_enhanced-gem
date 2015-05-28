require 'forwardable'

module GosuEnhanced
  # Hold a rectangular region specified by a Point and a Size
  # Most functions are delegated to the constituent Point and Size
  class Region
    extend Forwardable

    def_delegators :@position, :move_by!, :move_to!, :x, :y
    def_delegators :@size, :inflate!, :deflate!, :width, :height

    attr_reader :position, :size

    def initialize( pos, size )
      @position = pos.dup
      @size = size.dup
    end

    def contains?( col, row = nil )
      return contains_point?( col ) if col.respond_to? :x

      col.between?( left, left + width - 1 ) &&
        row.between?( top, top + height - 1 )
    end

    def top
      position.y
    end

    def left
      position.x
    end

    # It is necessary to override dup to produce an actual duplicate.
    def dup
      Region.new( position, size )
    end

    def draw( surface, z_order, colour )
      surface.draw_rectangle( position, size, z_order, colour )
    end

    def to_s
      "<GosuEnhanced::Region: #{position}, #{size}>"
    end

    private

    def contains_point?( pt )
      pt.x.between?( left, left + width - 1 ) &&
        pt.y.between?( top, top + height - 1 )
    end
  end
end
