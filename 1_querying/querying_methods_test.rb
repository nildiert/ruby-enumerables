require 'minitest/autorun'

class TestEnumerableMethods < Minitest::Test
  def setup
    @arr = [1, 2, 2, 3, 3, 3, 4, 4, 5]
  end

  def test_include
    assert_equal true, @arr.include?(3)
    assert_equal false, @arr.include?(8)
  end

  def test_all
    assert_equal false, @arr.all? { |num| num.even? }
    assert_equal false, @arr.all? { |num| num.odd? }
  end

  def test_any
    assert_equal true, @arr.any? { |num| num.even? }
    assert_equal true, @arr.any? { |num| num.odd? }
  end

  def test_none
    assert_equal false, @arr.none? { |num| num.even? }
    assert_equal false, @arr.none? { |num| num.odd? }
  end

  def test_one
    assert_equal true, @arr.one? { |num| num == 1}
    assert_equal false, @arr.one? { |num| num.even?}
    assert_equal false, @arr.one? { |num| num.odd?}
  end

  def test_count
    assert_equal 5, @arr.count { |num| num.odd?}
    assert_equal 4, @arr.count { |num| num.even?}
  end

  def test_tally
    expected = {1=>1, 2=>2, 3=>3, 4=>2, 5=>1}
    assert_equal expected, @arr.tally
  end

end
