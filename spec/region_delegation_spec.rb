require 'spec_helper'

describe GosuEnhanced::Region do
  let(:point) { GosuEnhanced::Point.new(10, 20) }
  let(:size)  { GosuEnhanced::Size.new(30, 40) }

  describe '#x' do
    it 'should return the left (x) co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      expect(reg.x).to eq 10
    end
  end

  describe '#y' do
    it 'should return the top (y) co-ordinate' do
      reg = GosuEnhanced::Region.new(point, size)
      expect(reg.y).to eq 20
    end
  end

  describe '#width' do
    it 'should return the width' do
      reg = GosuEnhanced::Region.new(point, size)
      expect(reg.width).to eq 30
    end
  end

  describe '#height' do
    it 'should return the height' do
      reg = GosuEnhanced::Region.new(point, size)
      expect(reg.height).to eq 40
    end
  end

  describe '#move_by!' do
    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(GosuEnhanced::Point.new(30, 40))
      expect(reg.left).to eq 40
      expect(reg.top).to eq 60

      # The original point should not have been changed by the move_by!
      expect(point.x).to eq 10
      expect(point.y).to eq 20
    end

    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(GosuEnhanced::Size.new(40, 50))
      expect(reg.left).to eq 50
      expect(reg.top).to eq 70
    end

    it 'should work with two positive values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(40, 50)
      expect(reg.left).to eq 50
      expect(reg.top).to eq 70
    end

    it 'should work with two negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(-5, -10)
      expect(reg.left).to eq 5
      expect(reg.top).to eq 10
    end

    it 'should work with values that result in negative co-ordinates' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_by!(-80, -150)
      expect(reg.left).to eq(-70)
      expect(reg.top).to eq(-130)
    end
  end

  describe '#move_to!' do
    it 'should work with a Point' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(GosuEnhanced::Point.new(30, 40))
      expect(reg.left).to eq 30
      expect(reg.top).to eq 40

      expect(point.x).to eq 10
      expect(point.y).to eq 20
    end

    it 'should work with two positive values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(40, 50)
      expect(reg.left).to eq 40
      expect(reg.top).to eq 50
    end

    it 'should work with two negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.move_to!(-5, -10)
      expect(reg.left).to eq(-5)
      expect(reg.top).to eq(-10)
    end
  end

  describe '#inflate!' do
    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(GosuEnhanced::Size.new(30, 40))
      expect(reg.width).to eq 60
      expect(reg.height).to eq 80

      # The original size should not have been changed by the inflate!
      expect(size.width).to eq 30
      expect(size.height).to eq 40
    end

    it 'should work with two values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(40, 50)
      expect(reg.width).to eq 70
      expect(reg.height).to eq 90
    end

    it 'should work with negative values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.inflate!(-20, -35)
      expect(reg.width).to eq 10
      expect(reg.height).to eq 5
    end

    it 'should raise an error with out-of-range values' do
      reg = GosuEnhanced::Region.new(point, size)
      expect { reg.inflate!(-50, -20) }.to raise_error Exception
      expect { reg.inflate!(-25, -60) }.to raise_error Exception
      expect { reg.inflate!(-50, -70) }.to raise_error Exception
    end
  end

  describe '#deflate!' do
    it 'should work with a Size' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.deflate!(GosuEnhanced::Size.new(20, 35))
      expect(reg.width).to eq 10
      expect(reg.height).to eq 5

      expect(size.width).to eq 30
      expect(size.height).to eq 40
    end

    it 'should work with two values' do
      reg = GosuEnhanced::Region.new(point, size)
      reg.deflate!(10, 25)
      expect(reg.width).to eq 20
      expect(reg.height).to eq 15
    end

    it 'should raise an error for out-of-range values' do
      reg = GosuEnhanced::Region.new(point, size)
      expect { reg.deflate!(25, 50) }.to raise_error Exception
      expect { reg.deflate!(60, 35) }.to raise_error Exception
      expect { reg.deflate!(80, 70) }.to raise_error Exception
    end
  end
end
