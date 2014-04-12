module GosuEnhanced
  # Hold a 2-dimensional size and allow for inflation / deflation
  class Size < Struct.new( :width, :height )
    # Inflation with a negative value or deflation is not allowed to make a 
    # dimension negative.
  
    def inflate( by_w, by_h = nil )
      if by_w.respond_to? :width
        validate( by_w.width, by_w.height )
        
        Size.new( width + by_w.width, height + by_w.height )
      else
        validate( by_w, by_h )
        
        Size.new( width + by_w, height + by_h )
      end
    end

    def deflate( by_w, by_h = nil )
      if by_w.respond_to? :width
        inflate( -by_w.width, -by_w.height )
      else
        inflate( -by_w, -by_h )
      end
    end

    def inflate!( by_w, by_h = nil )
      if by_w.respond_to? :width
        validate( by_w.width, by_w.height )
        
        self.width  += by_w.width
        self.height += by_w.height
      else
        validate( by_w, by_h )
        
        self.width  += by_w
        self.height += by_h
      end
    end

    def deflate!( by_w, by_h = nil )
      if by_w.respond_to? :width
        inflate!( -by_w.width, -by_w.height )
      else
        inflate!( -by_w, -by_h )
      end
    end
    
    private
    
    def validate( by_w, by_h )
      fail "Cannot make size negative" if width + by_w < 0 || height + by_h < 0      
    end
  end  
end
