require 'nokogiri'
require 'open-uri'
require 'pry'


def scrape
  beer_info = []

  site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
  
  site.css("#content .style").each do |beer_site|
    each_beer = {
      :style_family => beer_site.css(".family-name").text,
      :style_name => beer_site.css(".style-name").text,
      :style_description => beer_site.css("p")[1].text
      # :commercial_examples => {
      #   # nested hash containing brewery and beer name
      # }
    }



  beer_info << each_beer
  end

  
  binding.pry
  site.css("#content .style").css(".winners .value").first.text

end

scrape

    # beer_site.css(".winners").each do |us_beer|
    #   commercial_beers = {
    #     :brewery => us_beer.css(".value").text,
    #     :beer_name => us_beer.css(".brewery").text
    #   }
    # end
