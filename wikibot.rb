require 'nokogiri'
require 'open-uri'


class Wikibot

def searchWiki(searchterm)

	#searchterm = gets.chomp
url = "http://en.wikipedia.org/wiki/#{searchterm}"

data = Nokogiri::HTML(open(url))

wikidata = data.css('.mw-content-ltr')
	wikidata.each do |content|
		title = data.at_css('.firstHeading').text
		basicstats = data.at_css('.infobox').text
		#data = data.at_css('.toc').text
		#puts "#{title} #{data}"
		#toc = data.at_css('.toc').text
		#basicstats.delete("\n")
		output = basicstats.tr("\n", '-')
		return "#{output}"

		#puts "#{basicstats.gsub}"
		#basicstats.gsub(/[\n\n]/, '\n')
		
		
		#puts "#{basicstats}"
	end

	

	end

end
#searchWiki("cars")
		