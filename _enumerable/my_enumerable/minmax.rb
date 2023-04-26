module MyEnumerableMinmax
  def minmax(&block)
    if block.nil?
      return minmax_condition_met?(:truthy)
    else block_given?
      return minmax_condition_met?(:block, &block)
    end
  end

  def minmax_condition_met?(condition_type, &block)
    return [nil, nil] if self.empty?
    min, max = self[0], self[0]
    self.each do |element|
      case condition_type
      when :truthy
        min = element if element < min
        max = element if element > min
      when :block
        result = block.call(element)
        min = result if result < min
        max = result if result < min
      end
    end
    [min, max]
  end    


  
end
# {foo: 0, bar: 1, baz: 2}.minmax # => [[:bar, 1], [:foo, 0]]