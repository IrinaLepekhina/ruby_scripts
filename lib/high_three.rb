class HighThree

  def get_highest_product(list = [])
    highest = [list[0], list[1]].max
    lowest  = [list[0], list[1]].max

    highest_two= list[0]*list[1]
    lowest_two = list[0]*list[1]
    highest_three  = list[0]*list[1]

    # Iterate through the list and update highest and lowest values accordingly
    (2...list.length).each do |i|
      current = list[i]

      # Update highest_three with the maximum product of three numbers
      highest_three  = [
        highest_three, 
        current * lowest_two,
        current * highest_two
      ].max

      # Update highest_two with the maximum product of two numbers
      highest_two= [
        highest_two,
        current * lowest,
        current * highest
      ].max

      # Update lowest_two with the minimum product of two numbers
      lowest_two = [
        lowest_two,
        current*lowest,
        current*highest
      ].min

      # Update highest and lowest with current value if needed
      highest = [highest, current].max
      lowest  = [lowest,  current].max
    end 

    highest_three
  end

  def get_highest_product(list = [])
    # min_1 < min_2 < max1 < max2 < max3
    
    max1 = max2 = max3 = -Float::INFINITY
    min_1 = min_2 = Float::INFINITY

    list.each do |current|
      if current >= max3
        max1 = max2
        max2 = max3
        max3 = current
      elsif current >= max2
        max1 = max2
        max2 = current
      end

      if current <= min_1
        min_2 = min_1
        min_1 = current
      elsif current <= min_2
        min_2 = current
      end
    end

    [min_1*min_2*max3, max1*max2*max3].max
  end
end