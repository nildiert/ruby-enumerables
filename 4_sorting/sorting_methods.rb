range = 1..5
arr = [5, 3, 1, 4, 2]
words = ["apple", "banana", "cherry", "date", "fig"]

# ! sort
# * Devuelve los elementos ordenados utilizando el operador <=> o el bloque proporcionado.
puts arr.sort # => [1, 2, 3, 4, 5]
puts arr.sort { |a, b| b <=> a } # => [5, 4, 3, 2, 1]


# ! sort_by, filter, select
# *  Devuelve los elementos ordenados utilizando el bloque proporcionado para determinar el orden.
puts words.sort_by { |word| word.length } # => ["fig", "date", "apple", "banana", "cherry"]