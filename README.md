# gosu_enhanced V0.4.5

Some added classes for using Gosu. Updated to use Gosu 0.10.x.

## Point

Holds a set of (x, y) co-ordinates. Allows for offsetting and moving by another
Point, a Size, or a pair of co-ordinates.

## Size

Holds a (width, height) size. Allows for inflation / deflation with another
Size or a pair of dimensions.

## Region

Holds a position and size. Delegates movement and size change to its
constituents.

## Gosu::Window

Added #draw_rectangle which draws a simple rectangle specified with a Point
and Size in one colour and #draw_simple_line which draws a line in a single
colour.

#### N.B. There are serious warnings against using #draw_line for anything other than debugging purposes

## Gosu::Font

Added #measure and #centred_in / #centered_in which measure a piece of text
and centre it in a given Size respectively.

## Installation

Add this line to your application's Gemfile:

    gem 'gosu_enhanced'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gosu_enhanced

## Usage



## Contributing

1. Fork it ( https://github.com/JulianNicholls/gosu_enhanced/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## DISCLAIMER

I am not affiliated in any way to the authors of the Gosu Gem or
[libgosu](libgosu.org).

Gosu and all documentation © 2001-2019 Julian Raschke, Jan Lücker, and
other contributors. Gosu is released under the MIT license.
