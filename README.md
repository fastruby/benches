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


Here is the result:

    $ bundle exec ruby benchmarks/struct_vs_hash.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
              struct    18.585k i/100ms
                hash     3.685k i/100ms
    Calculating -------------------------------------
              struct    211.043k (± 8.0%) i/s -      1.059M in   5.056961s
                hash     43.300k (± 3.4%) i/s -    217.415k in   5.026906s

    Comparison:
              struct:   211043.3 i/s
                hash:    43299.6 i/s - 4.87x  slower

## Select + First vs. Detect

What's fastest `array.select {|x| condition(x) }.first` or
`array.detect {|x| condition(x) }`?

Here is the result:

    $ bundle exec ruby benchmarks/select_vs_detect.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
            select-first     5.037k i/100ms
                  detect     8.828k i/100ms
    Calculating -------------------------------------
            select-first     51.482k (± 2.3%) i/s -    261.924k in   5.090419s
                  detect     91.767k (± 3.4%) i/s -    459.056k in   5.008376s

    Comparison:
                  detect:    91767.2 i/s
            select-first:    51481.9 i/s - 1.78x  slower

## Map + Flatten vs. flat_map

What's fastest `array.map {|x| process(x) }.flatten` or
`array.flat_map {|x| process(x) }`?

Here is the result:

    $ bundle exec ruby benchmarks/map_flatten_vs_flat_map.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
             map-flatten     1.779k i/100ms
                flat_map     2.255k i/100ms
    Calculating -------------------------------------
             map-flatten     17.565k (± 7.8%) i/s -     87.171k in   5.000807s
                flat_map     22.575k (± 6.1%) i/s -    112.750k in   5.016034s

    Comparison:
                flat_map:    22575.4 i/s
             map-flatten:    17565.4 i/s - 1.29x  slower

## Time.parse vs. Time.at

What's fastest `Time.parse` or `Time.at`?

Here is the result:

    $ bundle exec ruby benchmarks/time/parse_vs_at.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
              Time.parse     2.761k i/100ms
                 Time.at    56.088k i/100ms
    Calculating -------------------------------------
              Time.parse     27.667k (± 7.4%) i/s -    138.050k in   5.019750s
                 Time.at    700.829k (± 4.4%) i/s -      3.534M in   5.052682s

    Comparison:
                 Time.at:   700829.3 i/s
              Time.parse:    27667.2 i/s - 25.33x  slower

## unless object.nil? vs. if object

What's fastest `unless object.nil?` or `if object`?

Here is the result:

    $ bundle exec ruby benchmarks/unless_nil_vs_if_object.rb
    Ruby version: 2.3.3
    Warming up --------------------------------------
          unless nil   251.994k i/100ms
           if object   267.552k i/100ms
    Calculating -------------------------------------
          unless nil      9.435M (± 6.9%) i/s -     47.123M in   5.021124s
           if object     11.431M (± 4.9%) i/s -     57.256M in   5.021363s

    Comparison:
           if object: 11431148.2 i/s
          unless nil:  9435226.8 i/s - 1.21x  slower

## Rails Benchmarks

What about Rails-specific code? Let's do some benchmarks comparing different
ways to achieve the same result.

## map vs. pluck

What's fastest `map` or `pluck`?

Here is the result:

    $ bundle exec rake benches:pluck_vs_map
    Warming up --------------------------------------
               map(&:id)    18.000  i/100ms
              pluck(:id)   107.000  i/100ms
    Calculating -------------------------------------
               map(&:id)    193.198  (±12.9%) i/s -    954.000  in   5.024860s
              pluck(:id)      1.056k (± 5.0%) i/s -      5.350k in   5.082911s

    Comparison:
              pluck(:id):     1055.8 i/s
               map(&:id):      193.2 i/s - 5.47x  slower


## Guidelines

Feel free to add more benchmark files in this project. The blocks which are
being compared should be simple and straightforward.
