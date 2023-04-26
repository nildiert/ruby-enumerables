module MyEnumerableAll
  def all?(*args, &block)
    if args.empty? && block.nil?
      return all_condition_met?(:truthy)
    elsif !args.empty?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 0..1)" if args.size > 1
      value = args[0]
      return all_condition_met?(:class, value) if value.is_a? Class
      return all_condition_met?(:regexp, value) if value.is_a? Regexp
      return all_condition_met?(:equal, value)
    elsif block_given?
      return all_condition_met?(:block, &block)
    end
  end

  private

  def all_condition_met?(condition_type, value = nil, &block)
    return false if self.empty?
    self.each do |element|
      case condition_type
      when :truthy
        return false unless element
      when :equal
        return false unless element == value
      when :class
        return false unless element.is_a?(value)
      when :regexp
        return false unless value.match(element)
      when :block
        return false unless block.call(element)
      end
    end
    true
  end  
end

