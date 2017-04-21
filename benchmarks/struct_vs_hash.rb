require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|
  Phone = Struct.new(:number)

  x.report("struct") do
    20.times do |i|
      str = Phone.new(i)
      str.number
    end
  end

  x.report("hash") do
    20.times do |i|
      str = Hash.new(number: i)
      str[:number]
    end
  end
end
