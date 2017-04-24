require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|
  ARRAY = [1, 1, 2, 3, 5, 8, 13, 21, 34].freeze

  x.report("map-flatten") do
    20.times do
      ARRAY.map {|x| x * 2 }.flatten
    end
  end

  x.report("flat_map") do
    20.times do
      ARRAY.flat_map {|x| x * 2 }
    end
  end

  x.compare!
end
