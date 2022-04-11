# GServer is a "generic server" system. It feature thread pool management, 
# logging and tools to manage multiple servers at the same time.

require 'gserver'
class HelloServer < GServer
  def serve(io)
    io.puts("Hello!")
  end
end
server = HelloServer.new(1234)
server.start
server.join

# This code implements a basic server that simply outputs the word “Hello!” 
# to any client connecting to port 1234. If you telnet to connect to port 1234 
# i.e. "telnet 127.0.0.1 1234" you’ll see the string “Hello!” returned to you 
# before the connection is closed.