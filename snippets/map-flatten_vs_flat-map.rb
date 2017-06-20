# Bad
ARRAY.map {|x| x * 2 }.flatten

# Good
ARRAY.flat_map {|x| x * 2 }
