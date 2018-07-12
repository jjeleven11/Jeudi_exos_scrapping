require 'rubygems'
require 'nokogiri'
require 'open-uri'

@page_url = "https://coinmarketcap.com/all/views/all/"

def     get_price(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("[class=price]")
  # puts news_links
  news_links.each do |link|
    links[i] = link['data-usd']
    i +=1;
  end
  return links
end

def     get_name(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("[class=price]")
  # puts news_links
  news_links.each do |link|
    links[i] = link['href']
    i +=1;
  end
  return links
end


def     parse_string(news_links)
  i = 0;
  code = []
  news_links.each do |link|
    code[i] = link.split('/')[2]
    i +=1
  end
  return code
end

def create_hash(country, code)
  my_hash = {}
  country.each_with_index do |elem, index|
    my_hash[elem] = code[index]
  end
  return my_hash
end

def perform
  price=[]
  my_hash = {}
  price = get_price(@page_url)
  names = []
  names = parse_string(get_name(@page_url))
  my_hash = create_hash(names,price)
  puts "#{my_hash}"
end

perform
