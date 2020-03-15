class BostonMuseums::Scraper
  def self.scrape_categories(category)
   url = "https://www.tripadvisor.com/"
   webpage = Nokogiri::HTML(open(url))
   section = webpage.css("div.attraction_list_all.easyClear")
   array_of_links = section.css("div div.listing_details")
   
   array_of_links.map do |link|
     binding.pry
   BostonMuseums::Category.new(link.text, link.attributes["href"].value)
end

 def self.scrape_museums(category)
    webpage = Nokogiri::HTML(open(category.url))
    museums = webpage.css("div.attraction_element")
   
    museums.each do |card|
      museum = BostonMuseums::Museum.new

      museum.name = card.css("div.listing_title.title_with_snippets h2").text.strip
      museum.reviews = card.css("div.review_snippets").text.strip
      museum.ratings  = card.css("div.popRanking.wrap").text.strip

    category.add_museum(museum)
   end
  end
 end
end