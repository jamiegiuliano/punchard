require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_activity(merchants)
     @dates = merchants.collect do |m|
     doc = Nokogiri::HTML(open(m.link.url))
     doc.search("div.welcome-content__event__subtitle").children.first.text
   end
   @dates.sort!
   binding.pry
  end

end
