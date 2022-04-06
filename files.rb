f = File.new("logfile.txt", "a")
f.puts Time.now
f.close

p File.open("logfile.txt", "r").external_encoding

Dir.foreach("/usr/bin") do |entry|
    puts entry
  end