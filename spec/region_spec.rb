require 'spec_helper'

describe GosuEnhanced::Region do
  let( :point ) { GosuEnhanced::Point.new( 10, 20 ) }
  let( :size )  { GosuEnhanced::Size.new( 30, 40 ) }

  describe '#initialize' do
    it 'should work with a Point and a Size' do
      GosuEnhanced::Region.new( point, size )
    end
  end

  describe '#position' do
    it 'should return the position as a Point' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.position ).to eq GosuEnhanced::Point.new( 10, 20 )
    end
  end

  describe '#top' do
    it 'should return the top co-ordinate' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.top ).to eq 20
    end
  end

  describe '#left' do
    it 'should return the left co-ordinate' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.left ).to eq 10
    end
  end

  describe '#size' do
    it 'should return the size as a Size' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.size ).to eq GosuEnhanced::Size.new( 30, 40 )
    end
  end

  describe '#contains?' do
    it 'should work with two co-ordinates' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.contains?( 10, 20 ) ).to be true
      expect( reg.contains?( 20, 35 ) ).to be true
      expect( reg.contains?( 29, 59 ) ).to be true
      expect( reg.contains?( 30, 60 ) ).to be false
    end

    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.contains?( GosuEnhanced::Point.new( 10, 20 ) ) ).to be true
      expect( reg.contains?( GosuEnhanced::Point.new( 20, 35 ) ) ).to be true
      expect( reg.contains?( GosuEnhanced::Point.new( 29, 59 ) ) ).to be true
      expect( reg.contains?( GosuEnhanced::Point.new( 30, 60 ) ) ).to be false
    end
  end

  # Unlike the Point and Size, a Region needs a dup override to actually return
  # a duplicate correctly.

  describe '#dup' do
    it 'should duplicate a region' do
      reg     = GosuEnhanced::Region.new( point, size )
      new_reg = reg.dup

      expect( reg.position ).to eq GosuEnhanced::Point.new( 10, 20 )
      expect( reg.size ).to eq GosuEnhanced::Size.new( 30, 40 )

      expect( new_reg.position ).to eq GosuEnhanced::Point.new( 10, 20 )
      expect( new_reg.size ).to eq GosuEnhanced::Size.new( 30, 40 )

      new_reg.move_to!( 20, 30 )
      new_reg.inflate!( 10, 10 )
      expect( new_reg.position ).to eq GosuEnhanced::Point.new( 20, 30 )
      expect( new_reg.size ).to eq GosuEnhanced::Size.new( 40, 50 )

      expect( reg.position ).to eq GosuEnhanced::Point.new( 10, 20 )
      expect( reg.size ).to eq GosuEnhanced::Size.new( 30, 40 )
    end
  end

  describe '#to_s' do
    it 'should render usefully' do
      point   = GosuEnhanced::Point.new( 10, 20 )
      size    = GosuEnhanced::Size.new( 30, 40 )
      region  = GosuEnhanced::Region.new( point, size )

      expect( region.to_s ).to eq '<GosuEnhanced::Region: ' \
      '#<struct GosuEnhanced::Point x=10, y=20>' \
      ', <GosuEnhanced::Size 30x40>>'
    end
  end
end
