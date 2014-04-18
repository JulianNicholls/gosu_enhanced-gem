# GosuEnhanced

Some added classes for using Gosu.

## Point

Holds a set of (x, y) co-ordinates. Allows for offsetting and moving by another 
Point or a pair of co-ordinates.

## Size

Holds a (width, height) size. Allows for inflation / deflation with another
size or a pair of sizes.

## Region

Holds a position and size. Delegates movement and size change to its 
constituents.

## Gosu::Window

Added #draw_rectangle which draws a simple rectangle specified with a Point 
and Size in one colour.

## Gosu::Font

Added #measure and #centred_in which measure a piece of text and centre it in
a given Size.

## Installation

Add this line to your application's Gemfile:

    gem 'gosu_enhanced'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gosu_enhanced

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gosu_enhanced/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
