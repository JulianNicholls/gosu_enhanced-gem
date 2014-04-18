module GosuEnhanced
  # Hold a rectangular region specified by a Point position, and a Size
  class Region
    attr_reader :position, :size
    
    def initialize( pos, size )
      @position, @size = p, s
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
    
    def width
      @size.width
    end
    
    def height
      @size.height
    end
  end
end
