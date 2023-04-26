module MyEnumerableEachWithIndex
  def each_with_index(*args, &block)
    raise ArgumentError, "no se esperaban argumentos" unless args.empty?
    if block_given?
      return each_with_index_condition_met?(:block, &block)
    end
  end

  private

  def each_with_index_condition_met?(condition_type, &block)
    return nil if self.empty?
    index = 0
    self.each do |element|
      case condition_type
      when :block
        block.call(element, index)
        index += 1
      end
    end
  end  
end

