class RoomScraper
  def initialize(index_url)
    @index_url= index_url
    @doc= Nokogiri::HTML(open(index_url))
    binding.pry
  end
  # def scrape_time
  #   @doc.search("span.pl time")
  # end
  def rows
    @rows ||= @doc.css("div.content span.rows p.row") #if it already exists, leave it alone, if it doesnt exist, change it's value to wahat's ton right
  end #@doc.css or .search is same thing
  def call
    rows.each do |row_doc|#calls method above
      room= Room.create_from_hash(scrape_row(row_doc))
       #should put the room in the database or do new and save .
    end
  end
  def scrape_row(row) #scrape an individual row
    {
      :date_created => row.search("time").attribute("datetime").text
    :title=> row.search("a.hdrlnk").text,
    :url=> "#{index_url}#{row.search("a.hdrlnk").attribute("href").text}" #need the beginning so that it's absolute and not relative path
    :price=> row.search("span.price").text
      }

  end
end
