# Yo verify your code is fast enough, create a benchmark.
# In this example, you benchmark two different ways of counting from one to one million.

require 'benchmark'
iterations = 1000000
b = Benchmark.measure do
  for i in 1..iterations
    x = i
  end
end
c = Benchmark.measure do
  iterations.times do |i|
    x = i
  end
end
puts b
puts c

# Or written a different way that's easier to read (with headings)
require 'benchmark'
iterations = 1000000
Benchmark.bm do |bm|
  bm.report("for:") do
    for i in 1..iterations
      x = i
    end
  end
  bm.report("times:") do
    iterations.times do |i|
      x = i
    end
  end
end