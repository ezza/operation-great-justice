require 'operation/great/justice'

f = File.open('operation-uniq.txt', 'w+')

(1..100000).each do |i|
  f << "#{Operation::Great::Justice.generate_from_number i.to_s}\n"
end

f.close
