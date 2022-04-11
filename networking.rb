require 'net/ping'

if Net::Ping::External.new('www.google.com').ping
    puts 'Pong!'
else
    puts 'No response'
end
