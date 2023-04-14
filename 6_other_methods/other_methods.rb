range = 1..5
fruits = %w[apple banana cherry]

# ! map, collect
# * Estos métodos toman un bloque y aplican la operación definida en el bloque
# * a cada elemento de la enumeración. Luego, devuelven un nuevo arreglo con los resultados.
puts range.map {|num| num * num}.inspect # => [1, 4, 9, 16, 25]
puts range.collect {|num| num * num}.inspect # => [1, 4, 9, 16, 25]

# ! filter_map
# * Aplica el bloque a cada elemento de la enumeración y devuelve un nuevo arreglo
# * que contiene los valores devueltos por el bloque que sean "truthy" (no nil ni false).
puts range.filter_map {|num| num * num if num.even? }.inspect # => [4, 16]

# ! flat_map, collect_concat
# * Aplica el bloque a cada elemento de la enumeración y a continuación, aplana el resultado.
arr = [[1, 2], [3, 4], [5, 6]]
puts arr.flat_map {|sub_arr| sub_arr}.inspect # => [1, 2, 3, 4, 5, 6]
puts arr.collect_concat {|sub_arr| sub_arr}.inspect # => [1, 2, 3, 4, 5, 6]

# ! grep
# * Devuelve los elementos que coinciden con el objeto dado o los objetos devueltos por un bloque.
mixed = [1, 2, "hello", 4, "world"]
puts mixed.grep(Integer).inspect # => [1, 2, 4]

# ! grep_v
# * Devuelve los elementos que no coinciden con el objeto dado o los objetos
# * devueltos por un bloque.
puts mixed.grep_v(Integer).inspect  # => ["hello", "world"]

# ! reduce/inject
# * Combina todos los elementos de la enumeración utilizando un bloque o un
# * símbolo que representa una operación.
puts range.reduce(:+) # => 15
puts range.inject(:+) # => 15

# ! sum
# * Devuelve la suma de los elementos de la enumeración.
puts range.sum # => 15

# ! zip
# * Combina cada elemento con los elementos de otras enumeraciones y devuelve 
# * las n-tuplas o llama al bloque con cada una.
arr1 = (1..3).entries
arr2 = (4..6).entries
puts arr1.zip(arr2).inspect # => [[1, 4], [2, 5], [3, 6]]

# ! cycle
# * Llama al bloque con cada elemento, ciclando repetidamente un número
# * especificado de veces.
cycle_results = []
range.cycle(2) {|num| cycle_results << num}
puts cycle_results.inspect # => [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

