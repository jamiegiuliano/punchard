require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_activity(merchants)
    merchants.each do |m|
     doc = Nokogiri::HTML(open(m.link.url))
     visit = doc.search("div.welcome-content__event__subtitle").children.first.text
     m.last_visit = visit
     m.save
    end
  end
end
