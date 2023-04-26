module MyEnumerableFlatMap
  def flat_map(&block)
    raise ArgumentError, "Se espera un bloque" if block.nil?
    return flat_map_condition_met?(:block, &block)
  end

  alias collect_concat flat_map

  private

  def flat_map_condition_met?(condition_type, &block)
    array = []
    return [] if self.empty?
    self.each do |element|
      case condition_type
      when :block
        result = block.call(element)
        if result.is_a? Array
          array.concat(result)
        else
          array << result
        end
      end
    end
    array
  end  
end