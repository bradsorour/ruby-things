# Using the net/http library and checking errors and redirects
require 'net/http'

def get_web_document(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    
    case response
    when Net::HTTPSuccess
        return response.body.force_encoding("UTF-8")
    when Net::HTTPRedirection
        puts response['Location']
        return get_web_document(response['Location'])
    else
        return nil
    end
end

puts get_web_document('https://www.apress.com/sitemap.xml')
puts get_web_document('https://www.apress.com/doesnotexist.xml')
puts get_web_document('https://ruby-doc.org/core')


# Using Basic Authentication
require 'net/http'
url = URI.parse('http://browserspy.dk/password-ok.php')
Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  req.basic_auth('test', 'test')
  puts http.request(req).body
end

# If you need proxy support for HTTP requests and a HTTP proxy hostname
# and port are supplied on the command line, a HTTP proxy will be assigned
# to http_class 
require 'net/http'
http_class = ARGV.first ? Net::HTTP::Proxy(ARGV[0], ARGV[1]) : Net::HTTP
url = URI.parse('https://www.apress.com/sitemap.xml')
response = http_class.get_response(url)
puts response.body.force_encoding("UTF-8")

# Using HTTPS
require 'net/http'
url = URI.parse('https://www.apress.com/sitemap.xml')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'
request = Net::HTTP::Get.new(url.path)
puts http.request(request).body.force_encoding("UTF-8")