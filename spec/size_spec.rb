require 'spec_helper'

describe GosuEnhanced::Size do
  describe '#initialize' do
    it 'should work with two values' do
      size = GosuEnhanced::Size.new( 10, 20 )
      expect( size.width ).to eq 10
      expect( size.height ).to eq 20
    end

    it 'should reject negative values' do
      expect { GosuEnhanced::Size.new( -10, 20 ) }.to raise_error Exception
      expect { GosuEnhanced::Size.new( 10, -20 ) }.to raise_error Exception
      expect { GosuEnhanced::Size.new( -10, -20 ) }.to raise_error Exception
    end
  end

  describe '#inflate' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      esize = size.inflate( GosuEnhanced::Size.new( 30, 40 ) )
      expect( esize.width ).to eq 40
      expect( esize.height ).to eq 60
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      esize = size.inflate( 40, 50 )
      expect( esize.width ).to eq 50
      expect( esize.height ).to eq 70
    end

    it 'should work with negative values' do
      size  = GosuEnhanced::Size.new( 40, 50 )
      esize = size.inflate( -30, -20 )
      expect( esize.width ).to eq 10
      expect( esize.height ).to eq 30
    end

    it 'should raise an error with out-of-range values' do
      size  = GosuEnhanced::Size.new( 40, 50 )
      expect { size.inflate( -50, -20 ) }.to raise_error Exception
      expect { size.inflate( -30, -60 ) }.to raise_error Exception
      expect { size.inflate( -50, -70 ) }.to raise_error Exception
    end
  end

  describe '#deflate' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new( 60, 80 )
      esize = size.deflate( GosuEnhanced::Size.new( 30, 40 ) )
      expect( esize.width ).to eq 30
      expect( esize.height ).to eq 40
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new( 70, 60 )
      esize = size.deflate( 40, 50 )
      expect( esize.width ).to eq 30
      expect( esize.height ).to eq 10
    end

    it 'should raise an error for out-of-range values' do
      size  = GosuEnhanced::Size.new( 70, 60 )
      expect { size.deflate( 80, 50 ) }.to raise_error Exception
      expect { size.deflate( 60, 70 ) }.to raise_error Exception
      expect { size.deflate( 80, 70 ) }.to raise_error Exception
    end
  end

  describe '#inflate!' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      size.inflate!( GosuEnhanced::Size.new( 30, 40 ) )
      expect( size.width ).to eq 40
      expect( size.height ).to eq 60
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      size.inflate!( 40, 50 )
      expect( size.width ).to eq 50
      expect( size.height ).to eq 70
    end

    it 'should work with negative values' do
      size  = GosuEnhanced::Size.new( 40, 50 )
      size.inflate!( -30, -20 )
      expect( size.width ).to eq 10
      expect( size.height ).to eq 30
    end

    it 'should raise an error with out-of-range values' do
      size  = GosuEnhanced::Size.new( 40, 50 )
      expect { size.inflate!( -50, -20 ) }.to raise_error Exception
      expect { size.inflate!( -30, -60 ) }.to raise_error Exception
      expect { size.inflate!( -50, -70 ) }.to raise_error Exception
    end
  end

  describe '#deflate!' do
    it 'should work with another Size' do
      size  = GosuEnhanced::Size.new( 60, 80 )
      size.deflate!( GosuEnhanced::Size.new( 30, 40 ) )
      expect( size.width ).to eq 30
      expect( size.height ).to eq 40
    end

    it 'should work with two values' do
      size  = GosuEnhanced::Size.new( 70, 60 )
      size.deflate!( 40, 50 )
      expect( size.width ).to eq 30
      expect( size.height ).to eq 10
    end

    it 'should raise an error for out-of-range values' do
      size  = GosuEnhanced::Size.new( 70, 60 )
      expect { size.deflate!( 80, 50 ) }.to raise_error Exception
      expect { size.deflate!( 60, 70 ) }.to raise_error Exception
      expect { size.deflate!( 80, 70 ) }.to raise_error Exception
    end
  end

  describe '#dup' do
    it 'should make a copy of the Size' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      nsize = size.dup

      expect( size.width ).to eq 10
      expect( size.height ).to eq 20

      expect( nsize.width ).to eq 10
      expect( nsize.height ).to eq 20

      nsize.inflate!( 40, 50 )
      expect( nsize.width ).to eq 50
      expect( nsize.height ).to eq 70

      expect( size.width ).to eq 10
      expect( size.height ).to eq 20
    end
  end
  
  describe '#to_s' do
    it 'should render usefully' do
      size  = GosuEnhanced::Size.new( 10, 20 )
      expect( size.to_s ).to eq '<GosuEnhanced::Size 10x20>'
    end
  end
end
