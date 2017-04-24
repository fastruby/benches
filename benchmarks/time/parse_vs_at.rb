require 'benchmark/ips'
require 'time'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|

  x.report("Time.parse") do
    Time.parse("2000-01-01 06:00:00 UTC")
  end

  x.report("Time.at") do
    Time.at(946685160).utc
  end

  x.compare!
end
