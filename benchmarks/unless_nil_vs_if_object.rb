require 'benchmark/ips'

puts "Ruby version: #{RUBY_VERSION}"

objects = ["foobar", nil, 89, 99.0].freeze

objects.each do |object|
  puts "Testing with #{object.class}"

  Benchmark.ips do |x|
    x.report("unless nil") do
      true unless object.nil?
    end

    x.report("if object") do
      true if object
    end

    x.compare!
  end

  puts "done"
end
