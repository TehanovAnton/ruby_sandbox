require 'benchmark'
require 'pry'
require_relative 'config'
require_relative 'range_memory'
require_relative 'memory'

class SumOfMultiples
  @@configs_memory = Memory.new

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit_number)
    @config = Config.new(limit_number, @multiples)
    @limit_number = limit_number
    @main_raing = (1...@limit_number)

    # if @@configs_memory.last_memoried_range
    #   last_number = @@configs_memory.last_memoried_range.max
    #   # binding.pry
    #   @main_raing = ((last_number + 1)...@limit_number) if last_number < @limit_number
    # end

    @main_raing.map do |number|
      @@configs_memory[config] = {} unless @@configs_memory[config]

      sub_range = (1..number)
      prev_range = (1..number - 1)

      if @@configs_memory[config][sub_range].nil?
        selection = []
        source_range = sub_range

        if @@configs_memory[config][prev_range]
          selection << @@configs_memory[config][prev_range]

          source_range = sub_range.to_a - prev_range.to_a
        end

        selection << source_range.select do |sub_range_number|
          @multiples.any? { |multiple| (sub_range_number % multiple).zero? }
        end

        @@configs_memory.last_memoried_range = sub_range
        @@configs_memory[config][sub_range] = selection
      end

      @@configs_memory[config][sub_range]
    end
  end

  private

  attr_reader :config
end

Benchmark.bm do |x|
  x.report {
    SumOfMultiples.new(2, 3, 4, 5, 6, 7, 8, 9, 10).to(10_000)
  }
  @@configs_memory.last_memoried_range
  #   last_number = @@configs_memory.last_memoried_range.max
  #   # binding.pry
  #   @main_raing = ((last_number + 1)...@limit_number) if last_number < @limit_number
  # end
  x.report('optimized') {
    SumOfMultiples.new(2, 3, 4, 5, 6, 7, 8, 9, 10).to(10_000)
  }
end
