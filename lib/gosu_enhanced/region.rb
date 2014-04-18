require 'forwardable'

module GosuEnhanced
  # Hold a rectangular region specified by a Point position, and a Size
  # Most functions are delegated to the constituent Point and Size
  class Region
    extend Forwardable
    
    def_delegators :@position, :move_by!, :move_to!, :x, :y
    def_delegators :@size, :inflate!, :deflate!, :width, :height
    
    attr_reader :position, :size
    
    def initialize( pos, size )
      @position, @size = pos, size
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
      @position.y
    end
    
    def left
      @position.x
    end
  
    def dup
      Region.new( @position.dup, @size.dup )
    end
  end
end
