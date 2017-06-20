require 'benchmark/ips'
require 'ffaker'

namespace :benches do
  task all: [:exists_vs_any, :pluck_vs_map]

  task not_blank_vs_present: :environment do
    objects = ["foobar", nil, 89, 99.0].freeze

    objects.each do |object|
      puts "Testing with #{object.class}"

      Benchmark.ips do |x|
        x.report("!blank?") do
          !object.blank?
        end

        x.report("present?") do
          object.present?
        end

        x.compare!
      end

      puts "done"
    end
  end

  task exists_vs_any: :environment do
    100.times do
      Post.create(title: FFaker::Name.name)
    end

    Benchmark.ips do |x|
      x.report("present?") do
        Post.where.not(title: nil).present?
      end
      x.report("any?") do
        Post.where.not(title: nil).any?
      end
      x.report("exists?") do
        Post.where.not(title: nil).exists?
      end

      x.compare!
    end
  end

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
