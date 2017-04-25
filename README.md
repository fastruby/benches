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
    Ruby version: 2.4.0
    Warming up --------------------------------------
                  struct    11.580k i/100ms
                    hash     3.139k i/100ms
    Calculating -------------------------------------
                  struct    145.811k (±16.1%) i/s -    717.960k in   5.084306s
                    hash     31.147k (±16.3%) i/s -    150.672k in   5.057652s

    Comparison:
                  struct:   145810.7 i/s
                    hash:    31147.0 i/s - 4.68x  slower

## Guidelines

Feel free to add more benchmark files in this project. The blocks which are
being compared should be simple and straightforward.
