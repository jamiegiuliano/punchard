require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_square(merchant)
    doc = Nokogiri::HTML(open(merchant.links.last.url))
    img = doc.at('.landing-header__merchant-info img')['src']
    stars = doc.search("div.welcome-content__loyalty_progress_text").text.strip.to_i
    merchant.image = img
    merchant.star_count = stars
    merchant.save
  end
end
