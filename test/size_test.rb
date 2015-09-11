require 'test_helper'

describe GosuEnhanced::Size do
  describe '#initialize' do
    it 'should work with two values' do
      size = GosuEnhanced::Size.new(10, 20)
      size.width.must_equal 10
      size.height.must_equal 20
    end

    it 'should reject negative values' do
      expect { GosuEnhanced::Size.new(-10, 20) }.must_raise Exception
      expect { GosuEnhanced::Size.new(10, -20) }.must_raise Exception
      expect { GosuEnhanced::Size.new(-10, -20) }.must_raise Exception
    end

    it 'should work with the utility function' do
      size = GosuEnhanced.Size(10, 20)
      size.width.must_equal 10
      size.height.must_equal 20
    end
  end

  describe '#inflate' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new(10, 20)
      esize = size.inflate(GosuEnhanced::Size.new(30, 40))
      esize.width.must_equal 40
      esize.height.must_equal 60
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new(10, 20)
      esize = size.inflate(40, 50)
      esize.width.must_equal 50
      esize.height.must_equal 70
    end

    it 'should work with negative values' do
      size  = GosuEnhanced::Size.new(40, 50)
      esize = size.inflate(-30, -20)
      esize.width.must_equal 10
      esize.height.must_equal 30
    end

    it 'should raise an error with out-of-range values' do
      size  = GosuEnhanced::Size.new(40, 50)
      expect { size.inflate(-50, -20) }.must_raise Exception
      expect { size.inflate(-30, -60) }.must_raise Exception
      expect { size.inflate(-50, -70) }.must_raise Exception
    end
  end

  describe '#deflate' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new(60, 80)
      esize = size.deflate(GosuEnhanced::Size.new(30, 40))
      esize.width.must_equal 30
      esize.height.must_equal 40
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new(70, 60)
      esize = size.deflate(40, 50)
      esize.width.must_equal 30
      esize.height.must_equal 10
    end

    it 'should raise an error for out-of-range values' do
      size  = GosuEnhanced::Size.new(70, 60)
      expect { size.deflate(80, 50) }.must_raise Exception
      expect { size.deflate(60, 70) }.must_raise Exception
      expect { size.deflate(80, 70) }.must_raise Exception
    end
  end

  describe '#inflate!' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new(10, 20)
      size.inflate!(GosuEnhanced::Size.new(30, 40))
      size.width.must_equal 40
      size.height.must_equal 60
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new(10, 20)
      size.inflate!(40, 50)
      size.width.must_equal 50
      size.height.must_equal 70
    end

    it 'should work with negative values' do
      size  = GosuEnhanced::Size.new(40, 50)
      size.inflate!(-30, -20)
      size.width.must_equal 10
      size.height.must_equal 30
    end

    it 'should raise an error with out-of-range values' do
      size  = GosuEnhanced::Size.new(40, 50)
      expect { size.inflate!(-50, -20) }.must_raise Exception
      expect { size.inflate!(-30, -60) }.must_raise Exception
      expect { size.inflate!(-50, -70) }.must_raise Exception
    end
  end

  describe '#deflate!' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new(60, 80)
      size.deflate!(GosuEnhanced::Size.new(30, 40))
      size.width.must_equal 30
      size.height.must_equal 40
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new(70, 60)
      size.deflate!(40, 50)
      size.width.must_equal 30
      size.height.must_equal 10
    end

    it 'should raise an error for out-of-range values' do
      size  = GosuEnhanced::Size.new(70, 60)
      expect { size.deflate!(80, 50) }.must_raise Exception
      expect { size.deflate!(60, 70) }.must_raise Exception
      expect { size.deflate!(80, 70) }.must_raise Exception
    end
  end

  describe '#dup' do
    it 'should make a copy of the Size' do
      size  = GosuEnhanced::Size.new(10, 20)
      nsize = size.dup

      size.width.must_equal 10
      size.height.must_equal 20

      nsize.width.must_equal 10
      nsize.height.must_equal 20

      nsize.inflate!(40, 50)
      nsize.width.must_equal 50
      nsize.height.must_equal 70

      size.width.must_equal 10
      size.height.must_equal 20
    end
  end

  describe '#to_s' do
    it 'should render usefully' do
      size  = GosuEnhanced::Size.new(10, 20)
      size.to_s.must_equal '<GosuEnhanced::Size 10x20>'
    end
  end
end
