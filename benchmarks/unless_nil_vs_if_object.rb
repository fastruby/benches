require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

Benchmark.ips do |x|
  OBJECT = "nil".freeze

  x.report("unless nil") do
    20.times do
      true unless OBJECT.nil?
    end
  end

  x.report("if object") do
    true if OBJECT
  end

  x.compare!
end
