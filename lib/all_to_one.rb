class AllToOne

  # Gready
  def convert_array(list=[])
    if list.include?(nil) || list.include?(0) || list.any? { |x| !x.is_a?(Integer)} || list.size < 2 
      raise ArgumentError, 'List should contain only non-zero intagers'
    end

    n = list.length
    product_so_far = Array.new(n , 1)
    left_product = 1
    right_product = 1

    (0...n).each do |i|
      product_so_far[i] *= left_product
      left_product *= list[i]
    end

    (n-1).downto(0) do |i|
      product_so_far[i] *= right_product
      right_product *= list[i]
    end

    return product_so_far
  end

  # # brute force
  # def convert_array(list=[])
  #   if list.include?(nil) || list.include?(0) || list.any? { |x| !x.is_a?(Integer)} || list.size < 2 
  #     raise ArgumentError, 'List should contain only non-zero intagers'
  #   end

  #   n = list.length
  #   product = Array.new(n)

  #   n.times do |i|
  #     element = 1
  #     n.times do |nested_i|
  #       if i != nested_i
  #         element *= list[nested_i]
  #       end
  #     end
  #     product[i] = element

  #   end
  #   product
  # end
end
 

# 1     2     3     4     5     6
# 23456 13456 12456 12356 12346 12345

#left
# 1     1     12    123   1234  12345
#right
# 23456 3456  456   56    6     1

