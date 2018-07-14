require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Méthode qui récupere le nom des cryptomonnaies
def names

	array = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css(".currency-name-container").each do |names|
		array << names.text

	end
	return array
  end

#Méthode qui récupere le cours des cryptomonnaies
def price

	array = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css(".price").each do |price|
		array.push << price.text

	end
	return array
  end

var = Hash[names.zip(price)]

print var
