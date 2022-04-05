# Profiling tells you what code is taking what amount of time.
# By profiling your code you can immediately see where you should focus your optimization efforts

require 'ruby-prof'

class Calculator
    # profile the code
    RubyProf.start
    def self.count_to_large_number
        x = 0
        100000.times { x += 1 }
    end
    
    def self.count_to_small_number
        x = 0
        1000.times { x += 1 }
    end
    result = RubyProf.stop
    
    # print a flat profile to text
    printer = RubyProf::FlatPrinter.new(result)
    printer.print(STDOUT)
end

Calculator.count_to_large_number
Calculator.count_to_small_number

