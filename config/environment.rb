require 'bundler'
Bundler.require #loads gems
require_all 'lib'
require 'open-uri'
DB= {:connection => SQLite3::Database.new("db/rooms-development.sqlite")}
