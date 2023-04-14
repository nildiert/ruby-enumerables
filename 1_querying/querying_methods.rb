# ! Include
# ! member
# * include? / member?: Estos métodos devuelven true si la colección 
# * incluye el objeto especificado, de lo contrario, devuelven false.
arr = [1, 2, 3, 4, 5]
puts arr.include?(4) # => true
puts arr.include?(6) # => false

puts arr.member?(6) # => false

# ? ================================================================

# ! All
# * Este método devuelve true si todos los elementos de la colección cumplen 
# * con el criterio especificado, de lo contrario, devuelve false.
arr = [2, 4, 6, 8]
puts arr.all? {|num| num.even?} # => true
puts arr.all? {|num| num.odd?} # => false

# ? ================================================================

# ! Any
# * Este método devuelve true si al menos un elemento de la colección 
# * cumple con el criterio especificado, de lo contrario, devuelve false.  
arr = [1, 3, 4, 7]
puts arr.any? {|num| num.even?} # => true
puts arr.any? {|num| num.odd?} # => true

# ? ================================================================
# ! none
# * Este método devuelve true si ningún elemento de la colección cumple con el 
# * criterio especificado, de lo contrario, devuelve false.
arr = [1, 3, 5, 7]
puts arr.none? {|num| num.even?} # => true

# ? ================================================================
# ! one
# * Este método devuelve true si exactamente un elemento de la colección cumple con 
# * el criterio especificado, de lo contrario, devuelve false.
arr = [1, 3, 4, 7]
puts arr.one? {|num| num.even?} # => true

# ? ================================================================
# ! count
# * Este método devuelve la cantidad de elementos de la colección, basándose en un criterio 
# * de argumento o bloque si se proporciona.
arr = [1, 2, 3, 4, 5]
puts arr.count {|num| num.even?} # => 2

# ? ================================================================
# ! tally
# * Este método devuelve un nuevo Hash que contiene la cantidad de apariciones de cada 
# * elemento en la colección.
arr = [1, 2, 2, 3, 3, 3, 4, 4, 5]
result = arr.tally
puts result.inspect
# ? ================================================================