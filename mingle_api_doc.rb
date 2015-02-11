require "uri"
require "net/https"
require "time"
require "rubygems"
require "api_auth" # gem install api-auth

MINGLE_URL = "https://careerbuilder.mingle-api.thoughtworks.com/api/v2/projects.xml"

name = 'dave.bennett@careerbuilder.com'
hmac_password = '/yXQBIgN2iDCJL4kxe1XLMfX6RZtP7smd96alrcKdyo='

uri = URI.parse(MINGLE_URL)
puts "uri: #{uri}"
http = Net::HTTP.new(uri.host, uri.port)
puts "http-output: #{http}"
http.use_ssl = true

puts request = Net::HTTP::Get.new(uri.request_uri)
ApiAuth.sign!(request, name, hmac_password)

#response = http.request(request)
#puts response.body
