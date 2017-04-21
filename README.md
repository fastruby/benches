# Benches

A collection of Ruby benchmarks for fun and for the [Ombu Labs blog](https://www.ombulabs.com/blog)

## Struct vs Hash

What's most efficient? A Struct or a Hash? Let's create one of each, access them,
and compare the performance using `benchmark-ips`:

    require 'benchmark/ips'

    Phone = Struct.new(:number)

    Benchmark.ips do |x|

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


Here it the result:

    $ ruby benchmarks/struct_vs_hash.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
                  struct    20.863k i/100ms
                    hash     4.222k i/100ms
    Calculating -------------------------------------
                  struct    225.122k (± 3.9%) i/s -      1.127M in   5.013067s
                    hash     43.546k (± 4.6%) i/s -    219.544k in   5.053637s

## Guidelines

Feel free to add more benchmark files in this project. The blocks which are
being compared should be simple and straightforward.
