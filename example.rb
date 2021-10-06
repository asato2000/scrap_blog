require "net/http"
require "nokogiri"



def get_from(url)
  return Net::HTTP.get(URI(url))
end

def write_file(path, text)
  file = File.open(path, 'w') do |file|
  file.write(text)
  end
end






html = File.open('academy.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

tech = []
doc.xpath('//*[@id="contents"]/div[1]/div[2]/div/div[2]/div[1]').each do |section|

 contents = {category: nil, topic: []}
 contents[:category] = section.xpath('./h2').first.text
 section.xpath('./div').each do |node|
  title = node.xpath('./div/h4/a').first.text
  url = node.xpath('./div/h4/a').first["href"]
 topic = {title: title, url: url}
 contents[:topic] << topic 
 
 end
 tech << contents
end
pp tech

# write_file("academy.html",get_from("https://techacademy.jp/magazine/"))

# そもそも
# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[2]
# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[1]
# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[3] 
# aたぐ
# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/div[2]/h3/a
# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[1]/div[1]/div/h4/a

# /html/body/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/div[1]/div/h4/a
