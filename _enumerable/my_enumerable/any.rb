module MyEnumerableAny
  def any?(*args, &block)
    if args.empty? && block.nil?
      return any_condition_met?(:truthy)
    elsif !args.empty?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 0..1)" if args.size > 1
      value = args[0]
      return any_condition_met?(:class, value) if value.is_a? Class
      return any_condition_met?(:regexp, value) if value.is_a? Regexp
      return any_condition_met?(:equal, value)
    elsif block_given?
      return any_condition_met?(:block, &block)
    end    
  end

  private

  def any_condition_met?(condition_type, value = nil, &block)
    return false if self.empty?
    self.each do |element|
      case condition_type
      when :truthy
        return true if element
      when :equal
        return true if element == value
      when :class
        return true if element.is_a?(value)
      when :regexp
        return true if value.match(element)
      when :block
        return true if block.call(element)
      end
    end
    false
  end
end
