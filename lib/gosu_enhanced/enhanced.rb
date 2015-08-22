# Gosu is the module that the Gosu library uses. It is re-opened here to allow
# access to the Window and Font classes.
module Gosu
  # Add a draw_rectangle() to Window which simplifies drawing a simple rectangle
  # in one colour
  class Window
    # Simplify drawing a rectangle in a single colour.
    #
    # +point+     [Point] Top left corner
    # +size+      [Size] Width and Height
    # +z_index+   [Fixnum] Z-order
    # +colour+    [Gosu::Color] Colour of rectangle

    def draw_rectangle(point, size, z_index, colour)
      left    = point.x
      top     = point.y
      width   = size.width
      height  = size.height

      draw_quad(
        left, top, colour,
        left + width, top, colour,
        left + width, top + height, colour,
        left, top + height, colour,
        z_index)
    end
  end

  # Add a measure to return both width and height for a text and a way
  # to centre a text in a rectangle.
  class Font
    include GosuEnhanced

    # Return the width and height of a given string
    #
    # +text+    String to measure
    #
    # return    [Size] The height and width of the string.

    def measure(text)
      Size.new(text_width(text, 1), height)
    end

    # Return the co-ordnates needed to place a given string in the centre of an
    # area, both vertically and horizontally.
    #
    # return    [Point] The point to write the string, expressed as an offset
    #           from the top-left corner of the rectangle.
    #
    # +text+    [String] String to centre
    # +rect+    [Size] Rectangular area size

    def centred_in(text, rect)
      size = measure(text)

      Point.new(
        (rect.width - size.width) / 2,
        (rect.height - size.height) / 2
      )
    end

    alias_method :centered_in, :centred_in
  end
end
