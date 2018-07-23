# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

# Scrapes HTML of Square account that User inputs
# Square API recently changed, creating temp solution
#  class Scraper < ApplicationRecord
  #  def self.scrape_square(merchant)
    #  doc = Nokogiri::HTML(open(merchant.links.last.url))
    #  img = doc.at('.landing-header__merchant-info img')['src']
    #  stars = doc.search('div.welcome-content__loyalty_progress_text')
    #  merchant.image = img
    #  merchant.star_count = stars.text.strip.to_i
    #  merchant.save
  #  end
#  end
