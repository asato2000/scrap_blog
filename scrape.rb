require "net/http"

url = 'https://manablog.org/'
uri = URI(url)
html = Net::HTTP.get(uri)
puts html
