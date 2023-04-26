module MyEnumerableEachWithObject
  def each_with_object(*args, &block)
    raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 1)" if args.empty?
    if block_given?
      return each_with_object_condition_met?(:block, args[0], &block)
    end
  end

  private

  def each_with_object_condition_met?(condition_type, object, &block)
    return nil if self.empty?
    self.each do |element|
      case condition_type
      when :block
        block.call(element, object)
      end
    end
    return object
  end  
end

