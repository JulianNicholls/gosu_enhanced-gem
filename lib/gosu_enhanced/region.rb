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
      @position, @size = pos.dup, size.dup
    end

    def contains?( col, row = nil )
      if col.respond_to? :x
        col.x.between?( left, left + width - 1 ) &&
        col.y.between?( top, top + height - 1 )
      else
        col.between?( left, left + width - 1 ) &&
        row.between?( top, top + height - 1 )
      end
    end

    def top
      position.y
    end

    def left
      position.x
    end

    # It is necessary to override dup to produce an actual duplicate.
    def dup
      Region.new( position.dup, size.dup )
    end

    def draw( surface, z_order, colour )
      surface.draw_rectangle( position, size, z_order, colour )
    end
  end
end
