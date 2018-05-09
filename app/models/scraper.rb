require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_image(merchant)
    doc = Nokogiri::HTML(open(merchant.link.url))
    img = doc.at('.landing-header__merchant-info img')['src']
    merchant.image = img
    merchant.save
  end

  def self.scrape_stars(merchants)
    merchants.each do |m|
     doc = Nokogiri::HTML(open(m.link.url))
     stars = doc.search("div.welcome-content__loyalty_progress_text").text.strip.to_i
     m.star_count = stars
     m.save
    end
  end
end
