require 'rubygems'
require 'nokogiri'
require 'open-uri'



def scrapping
    var = {}
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = page.css("a").select{|link| link['class'] == "lientxt"}
    links.each do |link|
        url = "http://annuaire-des-mairies.com#{link['href']}"
        link.each do |email|
            doc = Nokogiri::HTML(open(url))
            email = doc.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
            var.merge!(link: url, mail: email)
        end
        puts var
    end
end

scrapping
