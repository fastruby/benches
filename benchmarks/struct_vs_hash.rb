require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|
  Phone = Struct.new(:number)

  x.report("struct") do
    str = Phone.new(i)
    str.number
  end

  x.report("hash") do
    str = Hash.new(number: i)
    str[:number]
  end

  x.compare!
end
