module MyEnumerableInclude
  def include?(value)
    self.each { |element| return true if element == value }
    false
  end

  alias member? include?
end