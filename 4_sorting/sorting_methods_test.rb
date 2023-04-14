require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @range = 1..5
    @arr = [5, 3, 1, 4, 2]
    @words = %w[apple banana cherry date fig]
  end

  def test_sort_ascending
    assert_equal @range.entries, @arr.sort
  end

  def test_sort_descending
    assert_equal [5, 4, 3, 2, 1], @arr.sort { |a, b| b <=> a }
  end

  def test_sort_by
    result = ["fig", "date", "apple", "banana", "cherry"]
    assert_equal result, @words.sort_by {|word| word.length}
  end
end
