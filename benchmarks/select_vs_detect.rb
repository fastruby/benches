require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|
  ARRAY = [1, 1, 2, 3, 5, 8, 13, 21, 34].freeze

  x.report("select-first") do
    ARRAY.select {|x| x % 2 == 0 }.first
  end

  x.report("detect") do
    ARRAY.detect {|x| x % 2 == 0 }
  end

  x.compare!
end
