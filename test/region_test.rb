require 'test_helper'

describe GosuEnhanced::Region do
  let(:point) { GosuEnhanced::Point.new(10, 20) }
  let(:size)  { GosuEnhanced::Size.new(30, 40) }

  describe '#initialize' do
    it 'should work with a Point and a Size' do
      reg = GosuEnhanced::Region.new(point, size)

      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)
    end

    it 'should work with 2 Points' do
      point2 = GosuEnhanced::Point.new(40, 60)
      reg    = GosuEnhanced::Region.new(point, point2)

      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)
    end

    it 'should work with the utility function' do
      reg = GosuEnhanced.Region(point, size)

      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)
    end
  end

  describe '#position' do
    it 'should return the position as a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
    end
  end

  describe '#top' do
    it 'should return the top co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.top.must_equal 20
    end
  end

  describe '#left' do
    it 'should return the left co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.left.must_equal 10
    end
  end

  describe '#size' do
    it 'should return the size as a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)
    end
  end

  describe '#contains?' do
    it 'should work with two co-ordinates' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.contains?(10, 20).must_equal true
      reg.contains?(20, 35).must_equal true
      reg.contains?(29, 59).must_equal true
      reg.contains?(30, 60).must_equal false
    end

    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.contains?(GosuEnhanced::Point.new(10, 20)).must_equal true
      reg.contains?(GosuEnhanced::Point.new(20, 35)).must_equal true
      reg.contains?(GosuEnhanced::Point.new(29, 59)).must_equal true
      reg.contains?(GosuEnhanced::Point.new(30, 60)).must_equal false
    end
  end

  # Unlike the Point and Size, a Region needs a dup override to actually return
  # a duplicate correctly.

  describe '#dup' do
    it 'should duplicate a region without affecting the copied region' do
      reg     = GosuEnhanced::Region.new(point, size)
      new_reg = reg.dup

      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)

      new_reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      new_reg.size.must_equal GosuEnhanced::Size.new(30, 40)

      new_reg.move_to!(20, 30)
      new_reg.inflate!(10, 10)
      new_reg.position.must_equal GosuEnhanced::Point.new(20, 30)
      new_reg.size.must_equal GosuEnhanced::Size.new(40, 50)

      reg.position.must_equal GosuEnhanced::Point.new(10, 20)
      reg.size.must_equal GosuEnhanced::Size.new(30, 40)
    end
  end

  describe '#to_s' do
    it 'should render usefully' do
      point   = GosuEnhanced::Point.new(10, 20)
      size    = GosuEnhanced::Size.new(30, 40)
      region  = GosuEnhanced::Region.new(point, size)

      region.to_s.must_equal '<GosuEnhanced::Region: ' \
      '#<struct GosuEnhanced::Point x=10, y=20>' \
      ', <GosuEnhanced::Size 30x40>>'
    end
  end
end
