class Room
  attr_accessor :title, :date_created, :price, :url
  def self.create_from_hash(hash)
    new_from_hash(hash).save
  end
  def self.new_from_hash(hash)
    room=self.new
    room.title= hash[:title]
    room.date_created= hash[:date_created]
    room.price= hash[:price]
    room.url= hash[:url]
    room
  end
  def save
    DB[:connection].execute("INSERT INTO rooms (title, date_created, price, url) VALUES (?,?,?,?)", self.title,self.date_created,self.price,self.url)
  end
  def self.create_table
    DB[:connection].execute("CREATE TABLE IF NOT EXISTS rooms (
    id INTEGER PRIMARY KEY,
    title TEXT,
    date_created DATETIME,
    price TEXT,
    url TEXT
    )")
  end
end
