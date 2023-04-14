require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @range = 1..5
    @fruits = %w[apple banana cherry]
  end

  def test_each_entry
    results = []
    @range.each_entry {|number| results << number * 2}
    assert_equal [2, 4, 6, 8 ,10], results
  end

  def test_each_with_index
    results_with_index = []
    results = [["apple", 0], ["banana", 1], ["cherry", 2]]
    @fruits.each_with_index {|fruit, index| results_with_index << [fruit, index]}
    assert_equal results, results_with_index
  end
  
  def test_each_with_object
    sums = @range.each_with_object([]) { |number, result| result << number * 2}
    assert_equal [2, 4, 6, 8 , 10], sums
  end

  def test_each_slice
    slice_results = []
    results = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
    (1..10).each_slice(3) {|slice| slice_results << slice}
    assert_equal results, slice_results
  end

  def test_each_cons
    results = [[1, 2, 3], [2, 3, 4], [3, 4, 5]]
    cons_results = []
    @range.each_cons(3) {|cons| cons_results << cons}
    assert_equal results, cons_results
  end

  def test_reverse_each
    results = [5, 4, 3, 2, 1]
    reverse_results = []
    @range.reverse_each {|number| reverse_results << number}
    assert_equal results, reverse_results
  end

end
