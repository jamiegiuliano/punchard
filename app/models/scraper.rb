require 'open-uri'
require 'nokogiri'

class Scraper < ApplicationRecord

  def self.scrape_activity(url)
     doc = Nokogiri::HTML(open(url))
     binding.pry
  end

end
