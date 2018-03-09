class RoomScraper
  def initialize(index_url)
    @doc= Nokogiri::HTML(open(index_url))
  end
  # def scrape_time
  #   @doc.search("span.pl time")
  # end
  def rows
    @rows ||= @docs.search("div.content span.rows p.row") #if it already exists, leave it alone, if it doesnt exist, change it's value to wahat's ton right
  end
end
