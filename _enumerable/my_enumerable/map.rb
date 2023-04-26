module MyEnumerableMap
  def map(&block)
    raise ArgumentError, "Se espera un bloque" if block.nil?
    if block_given?
      return map_condition_met?(:block, &block)
    end
  end

  private

  def map_condition_met?(condition_type, &block)
    array = []
    return [] if self.empty?
    self.each do |element|
      case condition_type
      when :block
        array << block.call(element)
      end
    end
    array
  end  
end