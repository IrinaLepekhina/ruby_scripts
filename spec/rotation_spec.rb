require 'byebug'

RSpec.describe RotationFinder do
  describe '#find_rotation' do
    
    context 'list rotated' do
      it 'retuns index of the element where alphabetic order changes' do
        words = %w[ ptolemaic ptolemaic supplant undulate xenoepist 
                    asymptote babka banoffee engender karpatka othellolagkage ]
        finder = RotationFinder.new
        expect(finder.check(words)).to eq(5)
      end
    end

    context 'list not rotated' do
      it 'retuns index of the first elemet  = 0' do
        words = %w[ asymptote babka banoffee engender karpatka othellolagkage
                    ptolemaic retrograde supplant undulate xenoepist ]
        finder = RotationFinder.new
        expect(finder.check(words)).to eq(0)
      end
    end

    context 'when input list is not an array of strings' do
      it 'raises an ArgumentError' do
        finder = RotationFinder.new
        expect { finder.check([1, 2, 3]) }.to raise_error(ArgumentError)
      end
    end

    context 'when input list is empty' do
      it 'returns nil' do
        finder = RotationFinder.new
        expect(finder.check([])).to be_nil
      end
    end
  end
end