range = 1..5
arr = range.entries
words = %w[a b c d e]


# ! find, detect
# * Estos métodos devuelven todos los elementos en un Enumerable como un array.
puts arr.find {|num| num > 3} # => 4
puts arr.detect {|num| num > 3} # => 4

# ! find_all, filter, select
# * Devuelven todos los elementos que cumplen con la condición dada por el bloque.
puts arr.find_all {|num| num.even?} # => [2, 4]
puts arr.filter {|num| num.even?} # => [2, 4]
puts arr.select {|num| num.even?} # => [2, 4]

# ! find_index
# * Devuelve el índice del primer elemento que cumple con la condición
# * dada por el objeto o bloque.
puts words.find_index("c") # => 2


# ! reject
# * Devuelve todos los elementos que NO cumplen con la condición dada por el bloque.
puts  arr.reject {|num| num.odd?} # => [2, 4]

# ! uniq
# * Devuelve los elementos sin duplicados.
puts [1, 2, 2, 2, 3, 3, 4, 4, 5].uniq # => [1, 2, 3, 4, 5]
