module GosuEnhanced
  # Hold a 2-dimensional size and allow for inflation / deflation
  class Size
    attr_reader :width, :height

    # Neither dimension can be negative, since that doesn't make sense.
    # The values are checked on inflation / deflation.

    def initialize( w, h )
      @width, @height = w, h
      validate( 0, 0 )
    end

    def inflate( by_w, by_h = nil )
      self.dup.inflate!( by_w, by_h )
    end

    def deflate( by_w, by_h = nil )
      self.dup.deflate!( by_w, by_h )
    end

    def inflate!( by_w, by_h = nil )
      if by_w.respond_to? :width
        validate( by_w.width, by_w.height )

        @width  += by_w.width
        @height += by_w.height
      else
        validate( by_w, by_h )

        @width  += by_w
        @height += by_h
      end

      self
    end

    def deflate!( by_w, by_h = nil )
      if by_w.respond_to? :width
        inflate!( -by_w.width, -by_w.height )
      else
        inflate!( -by_w, -by_h )
      end
    end

    def ==( other )
      width == other.width && height == other.height
    end

    def to_s
      "<GosuEnhanced::Size #{width}x#{height}>"
    end

    private

    def validate( by_w, by_h )
      fail 'Cannot make size negative' if width + by_w < 0 || height + by_h < 0
    end
  end
end
