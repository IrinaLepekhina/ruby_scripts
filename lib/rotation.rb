class RotationFinder

  def check(list = [])
    switch_index = nil
    # Check for empty list
    if list.empty?
      switch_index = nil
      return switch_index
    end
    
    # Check for list format
    unless list.is_a?(Array) && list.all? { |elem| elem.is_a?(String) }
      raise ArgumentError, "Input must be an array of strings"
    end

    sorting_type = { az: 0, za: 1 }
    current_sorting = nil

    (0...list.length-1).each do |i|
      if list[i][0] < list[i+1][0]
        if current_sorting != sorting_type[:az]
          switch_index = i
          current_sorting = sorting_type[:az]
        end
      elsif list[i][0] == list[i+1][0]
        # Do nothing for equal elements
      else
        if current_sorting != sorting_type[:za]
          switch_index = i
          current_sorting = sorting_type[:za]
        end
      end
    end

    switch_index || 0
  end
end