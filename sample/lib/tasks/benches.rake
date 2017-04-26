require 'benchmark/ips'
require 'ffaker'

namespace :benches do
  task pluck_vs_map: :environment do
    100.times do
      Post.create(title: FFaker::Name.name)
    end

    Benchmark.ips do |x|
      x.report("map(&:id)") do
        Post.select(:id).map(&:id)
      end

      x.report("pluck(:id)") do
        Post.pluck(:id)
      end

      x.compare!
    end
  end
end
