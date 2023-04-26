module MyEnumerableTally
  def tally(*args)
    if args.empty?
      return tally_condition_met?(:truthy)
    elsif !args.empty?
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 0..1)" if args.size > 1
      value = args[0]
      return tally_condition_met?(:truthy, hash=value)
    end
  end

  private

  def tally_condition_met?(condition_type, hash = {}, &block)
    return {} if self.empty?
    self.each do |element|
      case condition_type
      when :truthy
        if hash[element]
          hash[element] += 1
        else
          hash[element] = 1
        end
      end
    end
    hash
  end  
end