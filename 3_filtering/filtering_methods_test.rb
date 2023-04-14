require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @range = 1..5
    @arr = @range.entries
    @words = %w[a b c d e]
    @arr2 = [1, 2, 2, 3, 3, 4, 5, 5]
  end

  def test_find
    assert_equal 4, @arr.find {|num| num > 3}
  end

  def test_detect
    assert_equal 4, @arr.detect {|num| num > 3}
  end

  def test_find_all
    result = [2, 4]
    assert_equal result, @arr.find_all {|num| num.even?}
  end

  def test_filter
    result = [2, 4]
    assert_equal result, @arr.filter {|num| num.even?}
  end

  def test_select
    result = [2, 4]
    assert_equal result, @arr.select {|num| num.even?}
  end

  def test_find_index
    assert_equal 2, @words.find_index("c")
  end

  def test_reject
    result = [2, 4]
    assert_equal result, @arr.reject {|num| num.odd?} 
  end

  def test_uniq
    assert_equal @arr, @arr2.uniq
  end

end
