require 'spec_helper'

describe GosuEnhanced::Point do
  describe '#initialize' do
    it 'should work with two positive values' do
      point = GosuEnhanced::Point.new( 10, 20 )
      expect( point.x ).to eq 10
      expect( point.y ).to eq 20
    end

    it 'should work with negative values' do
      point = GosuEnhanced::Point.new( -10, 20 )
      expect( point.x ).to eq -10
      expect( point.y ).to eq 20

      point = GosuEnhanced::Point.new( 10, -20 )
      expect( point.x ).to eq 10
      expect( point.y ).to eq -20

      point = GosuEnhanced::Point.new( -10, -20 )
      expect( point.x ).to eq -10
      expect( point.y ).to eq -20
    end
  end
  
  describe '#offset' do
    it 'should work with another Point' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      opoint = point.offset( GosuEnhanced::Point.new( 30, 40 ) )
      expect( opoint.x ).to eq 40
      expect( opoint.y ).to eq 60
    end

    it 'should work with two positive values' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      opoint = point.offset( 40, 50 )
      expect( opoint.x ).to eq 50
      expect( opoint.y ).to eq 70
    end

    it 'should work with two negative values' do
      point  = GosuEnhanced::Point.new( 60, 80 )
      opoint = point.offset( -40, -50 )
      expect( opoint.x ).to eq 20
      expect( opoint.y ).to eq 30
    end

    it 'should work with values that result in negative co-ordinates' do
      point  = GosuEnhanced::Point.new( 60, 80 )
      opoint = point.offset( -80, -150 )
      expect( opoint.x ).to eq -20
      expect( opoint.y ).to eq -70
    end
  end
  
  describe '#move_by!' do
    it 'should work with another Point' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      point.move_by!( GosuEnhanced::Point.new( 30, 40 ) )
      expect( point.x ).to eq 40
      expect( point.y ).to eq 60
    end
    
    it 'should work with two positive values' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      point.move_by!( 40, 50 )
      expect( point.x ).to eq 50
      expect( point.y ).to eq 70
    end

    it 'should work with two negative values' do
      point  = GosuEnhanced::Point.new( 60, 80 )
      point.move_by!( -40, -50 )
      expect( point.x ).to eq 20
      expect( point.y ).to eq 30
    end

    it 'should work with values that result in negative co-ordinates' do
      point  = GosuEnhanced::Point.new( 60, 80 )
      point.move_by!( -80, -150 )
      expect( point.x ).to eq -20
      expect( point.y ).to eq -70
    end
  end
  
  describe '#move_to!' do
    it 'should work with another Point' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      point.move_to!( GosuEnhanced::Point.new( 30, 40 ) )
      expect( point.x ).to eq 30
      expect( point.y ).to eq 40
    end
    
    it 'should work with two positive values' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      point.move_to!( 40, 50 )
      expect( point.x ).to eq 40
      expect( point.y ).to eq 50
    end

    it 'should work with two negative values' do
      point  = GosuEnhanced::Point.new( 60, 80 )
      point.move_to!( -40, -50 )
      expect( point.x ).to eq -40
      expect( point.y ).to eq -50
    end
  end
  
  # This might seem laboured, but I have run foul of dup before
  
  describe '#dup' do
    it 'should make a copy of the Point' do
      point  = GosuEnhanced::Point.new( 10, 20 )
      npoint = point.dup
      expect( point.x ).to eq 10
      expect( point.y ).to eq 20
      expect( npoint.x ).to eq 10
      expect( npoint.y ).to eq 20
      point.move_to!( 40, 50 )
      expect( point.x ).to eq 40
      expect( point.y ).to eq 50
      expect( npoint.x ).to eq 10
      expect( npoint.y ).to eq 20
    end
  end
end
