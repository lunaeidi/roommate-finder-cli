#!/usr/bin/env ruby
require_relative '../config/environment'
nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo')
nyc_scraper.call
