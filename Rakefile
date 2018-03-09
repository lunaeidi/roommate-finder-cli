require_relative './config/environment'
task :console do
  Pry.start
end
def reload!
  load_all './lib'
end
task :scrape_rooms do
  #instantiate a scraper and then have it find new rooms
  nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo').update_rooms
  nyc_scraper.call
  chicago scraper= RoomScraper.new('https://chicago.craigslist.org/search/roo').update_rooms
  chicago_scraper.call
  #after this method call, I should be able to say room.all and have rooms there.
end
