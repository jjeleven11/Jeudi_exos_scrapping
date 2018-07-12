require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Méthode qui récupere le nom des cryptomonnaies
def names
	arr = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css(".currency-name-container").each do |names|
		arr << names.text
	end
	return arr
end

#Méthode qui récupere le cours des cryptomonnaies
def price
	arr = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css(".price").each do |price|
		arr.push << price.text
	end
	return arr
end

var = Hash[names.zip(price)]

print var
