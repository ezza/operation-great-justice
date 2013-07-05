require 'operation/great/justice'

names = (1..100000).map { |i| Operation::Great::Justice.generate(i.to_s) }
puts "total operation names: #{names.size}"
puts "unique operation names: #{names.sort.uniq.size}"
