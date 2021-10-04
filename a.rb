require "nokogiri"
html = File.open('academy.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
section = doc.xpath('//*[@id="contents"]/div[1]/div[2]/div/div[2]/div[2]').first
category = section.xpath("./h2").text


category.each { |node| pp node }
# section.xpath('./div/div').each do |node|
#   title = node.xpath('./div/h3/a').first.text
#   url = node.xpath('./div/h3/a').first['href']
# end
