require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @range = 1..10
    @arr = @range.entries
    @arr2 = [1, 3, 2, 4, 6, 7, 5, 8, 10]
    @words = %w[apple banana orange]
    @animals = ["gato", "perro", "elefante", "pez", "gorila", "oso", "leon"]
    @word = "aaabbbcccddee"
  end

  def test_entries
    assert_equal @range.to_a, @range.entries
  end

  def test_first
    assert_equal 1, @arr.first
  end

  def test_take
    assert_equal @arr[0..2], @arr.take(3)
  end

  def test_drop
    assert_equal @arr[2..-1], @arr.drop(2)
  end

  def test_take_while
    assert_equal @arr[0..2], @arr.take_while {|num| num < 4}
  end

  def test_drop_while
    assert_equal @arr[4..-1], @arr.drop_while {|number| number < 5}
  end

  def test_min
    assert_equal 1, @arr.min
  end

  def test_max
    assert_equal 10, @arr.max
  end

  def test_minmax
    assert_equal [1, 10], @arr.minmax
  end

  def test_min_by
    assert_equal "apple", @words.min_by {|word| word.length}
  end

  def test_max_by
    assert_equal "banana", @words.max_by {|word| word.length}
  end

  def test_minmax_by
    assert_equal ["apple", "banana"], @words.minmax_by {|word| word.length}
  end

  def test_group_by
    result = {4=>["gato", "leon"], 5=>["perro"], 8=>["elefante"], 3=>["pez", "oso"], 6=>["gorila"]}
    assert_equal result, @animals.group_by {|animal| animal.length}
  end

  def test_partition
    result = [[2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
    assert_equal result, @arr.partition {|num| num.even?}
  end

  def test_slice_after
    result = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
    sliced = @arr.slice_after {|number| number % 3 == 0}
    assert_equal result, sliced.map {|part| part}
  end

  def test_slice_before
    result = [[1, 2], [3, 4, 5], [6, 7, 8], [9, 10]]
    sliced = @arr.slice_before {|number| number % 3 == 0}
    assert_equal result, sliced.map {|part| part}
  end

  def test_slice_when
    result = [[1], [2, 3], [4, 5], [6, 7], [8, 9], [10]]
    sliced = @arr.slice_when {|prev, cur| cur.even?}
    assert_equal result, sliced.map {|part| part}
  end

  def test_chunk
    result = [[false, [1, 3]], [true, [2, 4, 6]], [false, [7, 5]], [true, [8, 10]]]
    chunks = @arr2.chunk {|number| number.even?}
    assert_equal result, chunks.map {|part| part}
  end

  def test_chunk_while
    result = [["a", "a", "a"], ["b", "b", "b"], ["c", "c", "c"], ["d", "d"], ["e", "e"]]
    groups = @word.chars.chunk_while {|a, b| a==b}
    assert_equal result, groups.map {|group| group}
  end

end
