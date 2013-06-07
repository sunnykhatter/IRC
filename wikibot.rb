require 'nokogiri'
require 'open-uri'



searchterm = gets.chomp
url = "http://en.wikipedia.org/wiki/#{searchterm}"

data = Nokogiri::HTML(open(url))

wikidata = data.css('.mw-content-ltr')



	wikidata.each do |wikidata|
		title = data.at_css('.firstHeading').text
		data = data.at_css('.infobox').text
		puts "#{title} #{data}"


	end

		