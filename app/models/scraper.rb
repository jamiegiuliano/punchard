require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_activity(merchants)
    merchants.each do |m|
     doc = Nokogiri::HTML(open(m.link.url))
     stars = doc.search("div.welcome-content__loyalty_progress_text").text.strip.to_i
     m.star_count = stars
     m.save
    end
  end
end
