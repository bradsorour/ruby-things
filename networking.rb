require 'net/ping'
if Net::Ping::External.new('www.google.com').ping
    puts 'Pong!'
else
    puts 'No response'
end


# Resolv library is for converting between hostnames and IP addresses
require 'resolv'
puts Resolv.getaddress("www.google.com")
