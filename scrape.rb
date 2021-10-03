require "net/http"

url = 'https://manablog.org/'
uri = URI(url)
html = Net::HTTP.get(uri)

file = File.open("blog.html","w")
file.write(html)
file.close

