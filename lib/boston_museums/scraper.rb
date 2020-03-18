class BostonMuseums::Scraper
  def self.scrape_categories(type)
   url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-Boston_Massachusetts.html"
   webpage = Nokogiri::HTML(open(url))
   section = webpage.css("div.filter_list_1")
   array_of_links = section.css("label.label.filterName a.taLnk")
   
   array_of_links.map do |link|
   BostonMuseums::Category.new(link.text, link.attributes["href"].value, type)
  end

  def self.scrape_museums(category)
    webpage = Nokogiri::HTML(open(category.url))
    museums = webpage.css("div div.listing_details")
   
    museums.each do |card|
      museums = BostonMuseums::Museum.new

      museum.name = card.css("div.listing_title.title_with_snippets h2").text().strip
      museum.review = card.css("div.prw_rup.prw_attractions_attractions_review_snippets").text().strip
      museum.rating  = card.css("div.listing_rating").text().strip

      category.museums << museum
   end
  end
 end
end