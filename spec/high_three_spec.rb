require 'byebug'

describe HighThree do
  it 'returns  highest product that you can get by multiplying any 3 array elements' do
    list_1 = [2, 3, 4, 5, 6]
    list_2 = [2, 6, 4, 5, 3, 8]
    list_3 = [11, 6, 4, 10, 10]
    list_4 = [10, 1, 2, -8, -5]

    expect(HighThree.new.get_highest_product(list_1)).to eq(120)
    expect(HighThree.new.get_highest_product(list_2)).to eq(240)
    expect(HighThree.new.get_highest_product(list_3)).to eq(1100)
    expect(HighThree.new.get_highest_product(list_4)).to eq(400)
  end
end