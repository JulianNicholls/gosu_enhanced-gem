module Gosu
  # Add a draw_rectangle() to Window which simplifies drawing a simple rectangle
  # in one colour
  class Window
    def draw_rectangle( point, size, z_index, colour )
      left, top     = point.x, point.y
      width, height = size.width, size.height

      draw_quad(
        left, top, colour,
        left + width, top, colour,
        left + width, top + height, colour,
        left, top + height, colour,
        z_index
      )
    end
  end

  # Add a measure to return both width and height for a text and a way
  # to centre a text in a rectangle
  
  class Font
    def measure( text )
      Size.new( text_width( text, 1 ), height )
    end
    
    def centred_in( text, rect )
      size = measure( text )
      Point.new( 
        (rect.width - size.width) / 2, 
        (rect.height - size.height) / 2 
      )
    end

    alias_method :centered_in, :centred_in
  end  
end
