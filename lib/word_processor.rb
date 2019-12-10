require_relative('./flyweight_strategy')
require_relative('./run_array')
require 'memory_profiler'

class WordProcessor
  attr_accessor :strategy, :run_array, :unicode_values

  def initialize
    @strategy = FlyweightStrategy.new
    @run_array = RunArray.new
    @unicode_values = generate_random_unicode_point_array(200)
  end

  def calculate_size_for
    report = MemoryProfiler.report do
      strategy.calculate_stats(run_array, unicode_values)
    end

    report.pretty_print
  end

  def generate_random_unicode_point_array(n)
    run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
    run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
    run_array.append_run(200, { font_name: 'Times New Roman', font_size: 16 })

    n.times.map do
      rand(97..122)
    end
  end
end
