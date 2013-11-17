require 'nokogiri'
require 'open-uri'

marketplace_url = 'http://steamcommunity.com/market/search?q=appid%3A570'
page = Nokogiri::HTML(open(marketplace_url))
results = page.css('div#mainContents').css('div#searchResultsRows').css('a')
results.each do |row|
  item_name = row.css('span').children[-2].text

end
