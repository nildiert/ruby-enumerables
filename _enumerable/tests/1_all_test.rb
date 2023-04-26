require 'minitest/autorun'
require_relative '../enumerable'


class EnumerableTest < Minitest::Test
    def setup
      @array1 = MyEnumerable.new((1..4).entries)
      @array2 = MyEnumerable.new(%w[a b c d])
      @array3 = MyEnumerable.new([1, 2, nil])
      @array4 = MyEnumerable.new(['a','b', false])
      @array5 = MyEnumerable.new((%w[bar baz bat bam]).entries)
      @array6 = MyEnumerable.new({foo: 0, bar: 1, baz: 2})
      @array7 = MyEnumerable.new([])
    end

    def test_include
      assert_equal true, MyEnumerable.new((1..4).entries).include?(2)                       # => true
      assert_equal false, MyEnumerable.new((1..4).entries).include?(5)                       # => false
      assert_equal false, MyEnumerable.new((1..4).entries).include?('2')                     # => false
      assert_equal true, MyEnumerable.new(%w[a b c d]).include?('b')                # => true
      assert_equal false, MyEnumerable.new(%w[a b c d]).include?('2')                # => false
      # assert_equal true, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).include?(:foo)  # => true
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).include?('foo') # => false
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).include?(0)     # => false      
    end

    def test_member
      assert_equal true, MyEnumerable.new((1..4).entries).member?(2)                       # => true
      assert_equal false, MyEnumerable.new((1..4).entries).member?(5)                       # => false
      assert_equal false, MyEnumerable.new((1..4).entries).member?('2')                     # => false
      assert_equal true, MyEnumerable.new(%w[a b c d]).member?('b')                # => true
      assert_equal false, MyEnumerable.new(%w[a b c d]).member?('2')                # => false
      # assert_equal true, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).member?(:foo)  # => true
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).member?('foo') # => false
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).member?(0)     # => false      
    end

    def test_all
      assert_equal true, @array1.all?
      assert_equal true, @array2.all?      # => true
      assert_equal false, @array3.all?      # => false
      assert_equal false, @array4.all? # => false
      assert_equal true, @array1.all?(Integer)                 # => true
      assert_equal true, @array1.all?(Numeric)                 # => true
      assert_equal false, @array1.all?(Float)                   # => false
      assert_equal true, @array5.all?(/ba/)       # => true
      assert_equal false, @array5.all?(/bar/)      # => false
      assert_equal false, @array5.all?('ba')       # => false
      assert_equal true, @array6.all?(Array) # => true
      assert_equal false, @array6.all?(Hash) # => false
      assert_equal false, @array7.all?(Integer) # => false
    end

    def test_any
      assert_equal true, MyEnumerable.new((1..4).entries).any?          # => true
      assert_equal true, MyEnumerable.new(%w[a b c d]).any?     # => true
      assert_equal true, MyEnumerable.new([1, false, nil]).any? # => true
      assert_equal false, MyEnumerable.new([]).any?              # => false
      assert_equal true, MyEnumerable.new([nil, false, 0]).any?(Integer)        # => true
      assert_equal true, MyEnumerable.new([nil, false, 0]).any?(Numeric)        # => true
      assert_equal false, MyEnumerable.new([nil, false, 0]).any?(Float)          # => false
      assert_equal true, MyEnumerable.new(%w[bar baz bat bam]).any?(/m/)        # => true
      assert_equal false, MyEnumerable.new(%w[bar baz bat bam]).any?(/foo/)      # => false
      assert_equal false, MyEnumerable.new(%w[bar baz bat bam]).any?('ba')       # => false
      assert_equal true, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).any?(Array) # => true
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).any?(Hash)  # => false
      assert_equal false, MyEnumerable.new([]).any?(Integer)                     # => false
      assert_equal true, MyEnumerable.new((1..4)).any? {|element| element < 2 }                    # => true
      assert_equal false, MyEnumerable.new((1..4)).any? {|element| element < 1 }                    # => false
      assert_equal true, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).any? {|key, value| value < 1 } # => true
      assert_equal false, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).any? {|key, value| value < 0 } # => false
    end

    def test_count
      assert_equal 4, MyEnumerable.new([0, 1, 2, 1]).count              
      assert_equal 2, MyEnumerable.new([0, 1, 2, 1]).count(1)           
      assert_equal 2, MyEnumerable.new([0, 1, 2, 3]).count {|element| element < 2}              
      assert_equal 2, MyEnumerable.new({foo: 0, bar: 1, baz: 2}).count {|key, value| value < 2} 
    end

    def test_minmax
      assert_equal [1, 4], MyEnumerable.new((1..4).entries).minmax                   # => [1, 4]
      assert_equal [-4, -1], MyEnumerable.new((-4..-1).entries).minmax                 # => [-4, -1]
      assert_equal ["a", "d"], MyEnumerable.new(%w[d c b a]).minmax              # => ["a", "d"]
      assert_equal [nil, nil], MyEnumerable.new([]).minmax                       # => [nil, nil]
    end

    def test_map
      assert_equal [0, 1, 4, 9, 16], MyEnumerable.new((0..4).entries).map {|i| i*i }
    end

    def test_flat_map
      assert_equal [0, -1, -2, -3], MyEnumerable.new([0, 1, 2, 3]).flat_map {|element| -element }                    # => 
      assert_equal [0, 0, 1, -1, 2, -2, 3, -3], MyEnumerable.new([0, 1, 2, 3]).flat_map {|element| [element, -element] }         # => 
      assert_equal [0, 1, 100, 2, 3, 100], MyEnumerable.new([[0, 1], [2, 3]]).flat_map {|e| e + [100] }                     # => 
      assert_equal [:foo, 0, :bar, 1, :baz, 2], MyEnumerable.new({foo: 0, bar: 1, baz: 2}).flat_map {|key, value| [key, value] } # => 
    end

    def test_collect_concat
      assert_equal [0, -1, -2, -3], MyEnumerable.new([0, 1, 2, 3]).collect_concat {|element| -element }                    # => 
      assert_equal [0, 0, 1, -1, 2, -2, 3, -3], MyEnumerable.new([0, 1, 2, 3]).collect_concat {|element| [element, -element] }         # => 
      assert_equal [0, 1, 100, 2, 3, 100], MyEnumerable.new([[0, 1], [2, 3]]).collect_concat {|e| e + [100] }                     # => 
      assert_equal [:foo, 0, :bar, 1, :baz, 2], MyEnumerable.new({foo: 0, bar: 1, baz: 2}).collect_concat {|key, value| [key, value] } # => 
    end

    def test_tally
      assert_equal({"a"=>2, "b"=>3, "c"=>3}, MyEnumerable.new(%w[a b c b c a c b]).tally)

      hash = {}
      assert_equal({"a"=>2, "c"=>2, "d"=>1, "b"=>1}, MyEnumerable.new(%w[a c d b c a]).tally(hash)) # => 
      assert_equal({"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}, MyEnumerable.new(%w[b a z]).tally(hash)) # => 
      assert_equal({"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=> 1}, MyEnumerable.new(%w[b a m]).tally(hash)) # => 
    end

    def test_inject
      assert_equal  10, MyEnumerable.new((1..4).entries).inject(:+)     # => 10
      assert_equal  20, MyEnumerable.new((1..4).entries).inject(10, :+)     # => 20)
      assert_equal  30, MyEnumerable.new((1..4).entries).inject {|sum, n| sum + n*n }    # => 30
      assert_equal  32, MyEnumerable.new((1..4).entries).inject(2) {|sum, n| sum + n*n }    # => 32
      assert_equal  "abcd", MyEnumerable.new(('a'..'d').entries).inject(:+)            # => "abcd"
    end

    def test_reduce
      assert_equal  10, MyEnumerable.new((1..4).entries).reduce(:+)     # => 10
      assert_equal  20, MyEnumerable.new((1..4).entries).reduce(10, :+)     # => 20)
      assert_equal  30, MyEnumerable.new((1..4).entries).reduce {|sum, n| sum + n*n }    # => 30
      assert_equal  32, MyEnumerable.new((1..4).entries).reduce(2) {|sum, n| sum + n*n }    # => 32
      assert_equal  "abcd", MyEnumerable.new(('a'..'d').entries).reduce(:+)            # => "abcd"
    end

    def test_each_with_index
      h = {}
      MyEnumerable.new((1..4).entries).each_with_index {|element, i| h[element] = i } # => 1..4
      assert_equal({1=>0, 2=>1, 3=>2, 4=>3}, h)
      h = {}
      MyEnumerable.new(%w[a b c d]).each_with_index {|element, i| h[element] = i }
      # => ["a", "b", "c", "d"]
      assert_equal({"a"=>0, "b"=>1, "c"=>2, "d"=>3}, h)
    end

    def test_each_with_object
      assert_equal [1, 4, 9, 16], MyEnumerable.new((1..4).entries).each_with_object([]) {|i, a| a.push(i**2) }
    end

end