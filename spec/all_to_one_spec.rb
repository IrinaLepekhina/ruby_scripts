require 'byebug'

RSpec.describe AllToOne do
  describe '#convert_array' do
    it 'returnes error, if array containts 0, nil, not integer or too small' do
      brocken_list_1 = [5,0,1]
      brocken_list_2 = [5,nil,1]
      brocken_list_3 = [5,'',1]
      brocken_list_4 = [5]

      expect{AllToOne.new.convert_array(brocken_list_1)}.to raise_error(ArgumentError)
      expect{AllToOne.new.convert_array(brocken_list_2)}.to raise_error(ArgumentError)
      expect{AllToOne.new.convert_array(brocken_list_3)}.to raise_error(ArgumentError)
      expect{AllToOne.new.convert_array(brocken_list_4)}.to raise_error(ArgumentError)
    end

    it 'returnes converted array' do
      list_1 = [1, 2, 3, 4]
      list_2 = [1, 7, 3, 4]

      expect(AllToOne.new.convert_array(list_1)).to eq([24, 12, 8, 6])
      expect(AllToOne.new.convert_array(list_2)).to eq([84, 12, 28, 21])
    end

  end
end