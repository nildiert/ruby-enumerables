module MyEnumerableInject
  def inject(*args, &block)
    if args.empty? && block.nil?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 1..2)"
    elsif !args.empty?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 0..1)" if args.size > 2
      if args.size == 1 && block_given?
        return inject_condition_met?(:block, nil, args[0], &block) if args.size == 1
      elsif args.size > 1
        return inject_condition_met?(:symbol, symbol=args[1], value=args[0])
      else
        return inject_condition_met?(:symbol, symbol=args[0])
      end
    elsif block_given? && args.empty?
      return inject_condition_met?(:block, &block)
    end
      # return inject_condition_met?(:equal, value)

  end

  alias reduce inject

  private

  def inject_condition_met?(condition_type, symbol=nil, value = nil, &block)
    initial_value = value || operand_module(symbol)
    initial_value = '' if self[0].is_a? String
    self.each do |element|
      case condition_type
      when :symbol
        initial_value = initial_value.send(symbol, element)
      when :block
        initial_value = block.call(initial_value, element)
      end
    end
    initial_value
  end  

  def operand_module(symbol)
    case symbol
    when :+
      0
    when :-
      0
    when :*
      1
    when :/
      1
    end
    0
  end
end

