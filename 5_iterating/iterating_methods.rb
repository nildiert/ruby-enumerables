range = 1..5
fruits = %w[apple banana cherry]

# ! each_entry
# * Llama al bloque con cada elemento sucesivo
results = []
range.each_entry {|num| results << num * 2 }
puts results # => [2, 4, 6, 8, 10]

# ! each_with_index
# * Llama al bloque con cada elemento sucesivo y su índice.
results_with_index = []
fruits.each_with_index {|fruit, index| results_with_index << [fruit, index]}
puts results_with_index.inspect # => [["apple", 0], ["banana", 1], ["cherry", 2]]

# ! each_with_object
# * Llama al bloque con cada elemento sucesivo y un objeto dado.
sums = range.each_with_object([]) { |number, result| result << number * 2}
puts sums.inspect # => [2, 4, 6, 8, 10]

# ! each_slice
# * Llama al bloque con trozos sucesivos no superpuestos.
slice_results = []
(1..10).each_slice(3) {|slice| slice_results << slice}
puts slice_results.inspect # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

# ! each_cons
# *  Llama al bloque con trozos sucesivos superpuestos
cons_results = []
range.each_cons(3) {|cons| cons_results << cons}
puts cons_results.inspect # =>  [[1, 2, 3], [2, 3, 4], [3, 4, 5]]

# ! reverse_each
# * Llama al bloque con cada elemento sucesivo, en orden inverso.
reverse_results = []
range.reverse_each {|number| reverse_results << number}
puts reverse_results # => [5, 4, 3, 2, 1]