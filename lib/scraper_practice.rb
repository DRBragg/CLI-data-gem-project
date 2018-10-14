require 'nokogiri'
require 'open-uri'
require 'pry'


def scrape
  beer_info = []
  commercial_beer = {}

  site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
  
  site.css("#content .style").each do |beer_site|
    each_beer = {
      :style_family => beer_site.css(".family-name").text,
      :style_name => beer_site.css(".style-name").text,
      :style_description => beer_site.css("p")[1].text,
      :commercial_example => []
    }

    beer_site.css(".winners li").each do |example|
      commercial_beer = {
        :brewery => example.css(".brewery").text,
        :beer_name => example.css(".value").text 
      }
      each_beer[:commercial_example] << commercial_beer
    end




  beer_info << each_beer
  end

  
  binding.pry
  site.css("#content .style").css(".winners .value").first.text

end

scrape



    # Test