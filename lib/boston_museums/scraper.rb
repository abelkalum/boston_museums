class BostonMuseums::Scraper
  def self.scrape_categories(category)
   url = "https://www.tripadvisor.com/"
   webpage = Nokogiri::HTML(open(url))
   section = webpage.css("div.filter_list_1")
   array_of_links = section.css("div.jfy_checkbox.ui_input_checkbox.multifilter.cx_brand_refresh_phase2")

   array_of_links.map do |link|
  BostonMuseums::Category.new(link.text)
end

 def self.scrape_museums(category)
    webpage = Nokogiri::HTML(open(category.url))
    museums = webpage.css("div.attraction_element")
   
    museums.each do |card|
      museum = BostonMuseums::Museum.new

      museums = card.css("div.listing_title.title_with_snippets h2").text.strip
      museum.reviews = card.css("div.review_snippets").text.strip
      museum.ratings  = card.css("div.popRanking.wrap").text.strip

    category.add_museum(museum)
   end
  end
 end
end