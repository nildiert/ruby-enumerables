module MyEnumerableCount
  def count(*args, &block)
    if args.empty? && block.nil?
      return count_condition_met?(:truthy)
    elsif !args.empty?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 0..1)" if args.size > 1
      value = args[0]
      return count_condition_met?(:equal, value)
    elsif block_given?
      return count_condition_met?(:block, &block)
    end
  end

  private

  def count_condition_met?(condition_type, value = nil, &block)
    counter = 0
    return false if self.empty?
    self.each do |element|
      case condition_type
      when :truthy
        counter += 1 if element
      when :equal
        counter += 1 if element == value
      when :block
        counter += 1 if block.call(element)
      end
    end
    counter
  end  
end