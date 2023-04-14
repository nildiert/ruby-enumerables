require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @range = 1..5
    @fruits = %w[apple banana cherry]
    @mixed = [1, 2, "hello", 4, "world"]
  end

  def test_map
    results = [1, 4, 9, 16, 25]
    assert_equal results, @range.map {|num| num * num}
  end

  def test_collect
    results = [1, 4, 9, 16, 25]
    assert_equal results, @range.collect {|num| num * num}
  end

  def test_filter_map
    assert_equal [4, 16], @range.filter_map {|num| num * num if num.even? }
  end

  def test_flat_map
    arr = []
    (1..6).each_slice(2) {|number| arr << number}
    assert_equal (1..6).entries, arr.flat_map {|sub_arr| sub_arr}
  end

  def test_collect_concat
    arr = []
    (1..6).each_slice(2) {|number| arr << number}
    assert_equal (1..6).entries, arr.collect_concat {|sub_arr| sub_arr}
  end

  def test_grep
    numbers = @mixed.grep(Integer)
    assert_equal [1, 2, 4], numbers
  end

  def test_grep_v
    non_numbers = @mixed.grep_v(Integer)
    assert_equal ["hello", "world"], non_numbers
  end

  def test_reduce
    assert_equal 15, @range.reduce(:+)
  end

  def test_inject
    assert_equal 15, @range.inject(:+)
  end

  def test_sum
    assert_equal 15, @range.sum
  end

  def test_zip
    arr1 = (1..3).entries
    arr2 = (4..6).entries
    results = [[1, 4], [2, 5], [3, 6]]
    assert_equal results, arr1.zip(arr2)
  end

  def test_cycle
    cycle_results = []
    results = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
    @range.cycle(2) {|num| cycle_results << num}
    assert_equal results, cycle_results
  end
  
end
