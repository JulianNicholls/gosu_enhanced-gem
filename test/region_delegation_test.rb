require 'test_helper'

describe GosuEnhanced::Region do
  let(:point) { GosuEnhanced::Point.new(10, 20) }
  let(:size)  { GosuEnhanced::Size.new(30, 40) }

  describe '#x' do
    it 'should return the left (x) co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.x.must_equal 10
    end
  end

  describe '#y' do
    it 'should return the top (y) co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.y.must_equal 20
    end
  end

  describe '#width' do
    it 'should return the width' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.width.must_equal 30
    end
  end

  describe '#height' do
    it 'should return the height' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.height.must_equal 40
    end
  end

  describe '#move_by!' do
    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(GosuEnhanced::Point.new(30, 40))
      reg.left.must_equal 40
      reg.top.must_equal 60

      # The original point should not have been changed by the move_by!
      point.x.must_equal 10
      point.y.must_equal 20
    end

    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(GosuEnhanced::Size.new(40, 50))
      reg.left.must_equal 50
      reg.top.must_equal 70
    end

    it 'should work with two positive values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(40, 50)
      reg.left.must_equal 50
      reg.top.must_equal 70
    end

    it 'should work with two negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(-5, -10)
      reg.left.must_equal 5
      reg.top.must_equal 10
    end

    it 'should work with values that result in negative co-ordinates' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(-80, -150)
      reg.left.must_equal(-70)
      reg.top.must_equal(-130)
    end
  end

  describe '#move_to!' do
    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(GosuEnhanced::Point.new(30, 40))
      reg.left.must_equal 30
      reg.top.must_equal 40

      point.x.must_equal 10
      point.y.must_equal 20
    end

    it 'should work with two positive values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(40, 50)
      reg.left.must_equal 40
      reg.top.must_equal 50
    end

    it 'should work with two negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(-5, -10)
      reg.left.must_equal(-5)
      reg.top.must_equal(-10)
    end
  end

  describe '#inflate!' do
    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(GosuEnhanced::Size.new(30, 40))
      reg.width.must_equal 60
      reg.height.must_equal 80

      # The original size should not have been changed by the inflate!
      size.width.must_equal 30
      size.height.must_equal 40
    end

    it 'should work with two values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(40, 50)
      reg.width.must_equal 70
      reg.height.must_equal 90
    end

    it 'should work with negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(-20, -35)
      reg.width.must_equal 10
      reg.height.must_equal 5
    end

    it 'should raise an error with out-of-range values' do
      reg = GosuEnhanced::Region.new(point, size)
      expect { reg.inflate!(-50, -20) }.must_raise Exception
      expect { reg.inflate!(-25, -60) }.must_raise Exception
      expect { reg.inflate!(-50, -70) }.must_raise Exception
    end
  end

  describe '#deflate!' do
    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.deflate!(GosuEnhanced::Size.new(20, 35))
      reg.width.must_equal 10
      reg.height.must_equal 5

      size.width.must_equal 30
      size.height.must_equal 40
    end

    it 'should work with two values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.deflate!(10, 25)
      reg.width.must_equal 20
      reg.height.must_equal 15
    end

    it 'should raise an error for out-of-range values' do
      reg = GosuEnhanced::Region.new(point, size)
      expect { reg.deflate!(25, 50) }.must_raise Exception
      expect { reg.deflate!(60, 35) }.must_raise Exception
      expect { reg.deflate!(80, 70) }.must_raise Exception
    end
  end
end
