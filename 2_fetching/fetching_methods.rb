
# ! entries, to_a
# * Estos métodos devuelven todos los elementos en un Enumerable como un array.
range = 1..10
range.entries
puts range.entries.inspect # => [1, 2, 3, 4, 5, 6, 7, 8, 9 , 10]

# ! first
# * Este método devuelve el primer elemento o los primeros elementos especificados
# * en un Enumerable.
puts range.entries.first.inspect # => 1


# ! take
# * Este método devuelve un número especificado de elementos iniciales de un Enumerable.
puts range.entries.take(2).inspect # => [1, 2]

# ! drop
# * Este método devuelve un número especificado de elementos finales de un Enumerable,
# * eliminando los primeros n elementos.
puts range.entries.drop(2).inspect # => [3, 4, 5, 6, 7, 8, 9 , 10]

# ! take_while
# * Este método devuelve elementos iniciales de un Enumerable mientras se cumpla
# * una condición especificada por un bloque dado.
puts range.entries.take_while {|num| num < 4 } # => [1, 2, 3]

# ! drop_while
# * Este método devuelve elementos finales de un Enumerable mientras se cumpla una
# * condición especificada por un bloque dado. La eliminación de elementos se detiene
# * cuando el bloque devuelve false por primera vez.
puts range.entries.drop_while {|num| num < 4}  # => [4, 5, 6, 7, 8, 9, 10]

# ? ==================================================================================


# * Estos métodos son útiles cuando necesitas encontrar elementos mínimos,
# * máximos o ambos en un Enumerable. Puedes utilizarlos con un bloque para determinar cómo comparar los elementos en función de tus necesidades.

# ! min
# * Este método devuelve el elemento con el valor mínimo en un Enumerable.
puts range.entries.min.inspect # => 1

# ! max
# * Este método devuelve el elemento con el valor máximo en un Enumerable.
puts range.entries.max.inspect # => 10

# ! minmax
# * Este método devuelve un Array de 2 elementos que contiene el valor mínimo
# * y el valor máximo en un Enumerable.
puts range.entries.minmax.inspect # => [1, 10]

# ! min_by
# * Este método devuelve el elemento con el valor mínimo, según lo determinado
# * por el bloque dado.
words = %w[apple banana orange]
puts words.min_by {|word| word.length} # => "apple"

# ! max_by
# * Este método devuelve el elemento con el valor máximo, según lo determinado
# * por el bloque dado.
words.max_by {|word| word.length} # => "banana"

# ! minmax_by
# * Este método devuelve el elemento con el valor mínimo y el valor máximo,
# * según lo determinado por el bloque dado.
puts words.minmax_by {|word| word.length}.inspect # => ["apple", "banana"]

# ? ==================================================================================

# ! group_by
# * Este método devuelve un Hash que particiona los elementos en grupos según el bloque dado.
animals = ["gato", "perro", "elefante", "pez", "gorila", "oso", "leon"]
grouped_animals = animals.group_by { |animal| animal.length }
puts grouped_animals.inspect # => {4=>["gato", "leon"], 5=>["perro"], 8=>["elefante"], 3=>["pez", "oso"], 6=>["gorila"]}

# ! partition
# * Este método devuelve elementos particionados en dos nuevos Arrays, según lo determinado por el bloque dado.
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts numbers.partition {|number| number.even?} # => [[2, 4, 6, 8], [1, 3, 5, 7, 9]]

#! slice_after
# * Este método devuelve un nuevo Enumerator cuyas entradas son una partición de sí mismo, basado en un
# * objeto o bloque dado.
sliced = range.entries.slice_after {|num| num % 3 == 0 }
puts sliced.map {|part| part} # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

# ! slice_before
# * Este método devuelve un nuevo Enumerator cuyas entradas son una partición de sí mismo,
# * basado en un objeto o bloque dado.
sliced = range.entries.slice_before {|num| num % 3 == 0 }
puts sliced.map {|part| part} # => [[1, 2], [3, 4, 5], [6, 7, 8], [9, 10]]

# ! slice_when
# * Este método devuelve un nuevo Enumerator cuyas entradas son una partición de sí mismo basado en el bloque dado.
sliced = range.entries.slice_when {|prev, cur| cur.even?}
puts sliced.map {|part| part} # => [[1, 2], [3, 4, 5], [6, 7, 8], [9, 10]]

# ! chunk
# * Este método devuelve elementos organizados en fragmentos según lo especificado por el bloque dado.
arr = [1, 3, 2, 4, 6, 7, 5, 8, 10]
chunked = arr.chunk {|n| n.even? }
puts chunked.map {|part| part} # => [[false, [1, 3]], [true, [2, 4, 6]], [false, [7, 5]], [true, [8, 10]]]

# ! chunk_while
# * Este método devuelve elementos organizados en fragmentos según lo especificado por el bloque dado.
word = "aaabbbcccddee"
groups = word.chars.chunk_while { |a, b| a == b }
puts groups.map {|group| group}.inspect # => [["a", "a", "a"], ["b", "b", "b"], ["c", "c", "c"], ["d", "d"], ["e", "e"]]