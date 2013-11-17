require 'nokogiri'
require 'open-uri'
require 'logger'

def scrape_row_listing(row)
  cost = row.css('span').css('span').children[6].text.match(/\$.+ USD/).to_s
  available = row.css('span').css('span')[1].children.text
  item_name = row.css('span').css('span')[2].children.text
  puts "#{item_name} #{available} #{cost}"
end

def scrape_page(page)
  listings = page.css('div#mainContents').css('div#searchResultsRows').css('a')
  listings.each do |row|
    scrape_row_listing(row)
  end
end

def has_more_pages(page)
  current_page = page.css('span#searchResults_end').children.text.gsub(',','').to_i
  total_pages = page.css('span#searchResults_total').children.text.gsub(',','').to_i
  current_page < total_pages
end



log = Logger.new(STDERR)
marketplace_url = 'http://steamcommunity.com/market/search?q=appid%3A570'
count = 1
page = Nokogiri::HTML(open(marketplace_url))
while has_more_pages(page) && count < 5
  scrape_page(page)
  count += 1
  next_page = "#{marketplace_url}#p#{count}"
  page = Nokogiri::HTML(open(next_page))
  log.info "Scrapped #{count} pages, last page was: #{next_page}"
end

