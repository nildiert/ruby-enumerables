require 'pry'
require 'test/unit/assertions'
require_relative 'my_enumerable/my_enumerable_methods'
include Test::Unit::Assertions

class MyEnumerable < Array
  include MyEnumerableInclude
  include MyEnumerableAll
  include MyEnumerableAny
  include MyEnumerableCount
  include MyEnumerableMinmax
  include MyEnumerableMap
  include MyEnumerableFlatMap
  include MyEnumerableTally
  include MyEnumerableInject
  include MyEnumerableEachWithIndex
  include MyEnumerableEachWithObject

  def initialize(value)
    concat(value.to_a)
  end

end
