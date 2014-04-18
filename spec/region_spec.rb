require 'spec_helper'

describe GosuEnhanced::Region do
  let( :point ) { GosuEnhanced::Point.new( 10, 20 ) }
  let( :size )  { GosuEnhanced::Size.new( 30, 40 ) }
  
  describe '#initialize' do
    it 'should work with a Point and a Size' do
      reg = GosuEnhanced::Region.new( point, size )
    end
  end
  
  describe '#position' do
    it 'should return the position as a Point' do
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.position ).to eq GosuEnhanced::Point.new( 10, 20 )
    end
  end
  
  describe '#top' do
    it 'should return the top co-ordinate' do |variable|
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.top ).to eq 20
    end
  end

  describe '#left' do
    it 'should return the left co-ordinate' do |variable|
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
  
  describe '#width' do
    it 'should return the width' do |variable|
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.width ).to eq 30
    end
  end

  describe '#height' do
    it 'should return the height' do |variable|
      reg = GosuEnhanced::Region.new( point, size )
      expect( reg.height ).to eq 40
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
end
