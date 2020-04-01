class BostonMuseums::Scraper

  attr_accessor :museum_list_url

   BASE_PATH = "https://www.tripadvisor.com"
   museum_list_url = (BASE_PATH + "/Attractions-g60745-Activities-c49-Boston_Massachusetts.html#FILTERED_LIST")

  def self.scrape_index_page(museum_list_url) 
      doc = HTTParty.get(museum_list_url)
      index = Nokogiri::HTML(doc)
      scraped_museums = index.css(".listing_details")
      scraped_museums.collect do |museum_content|
         {
          :name => museum_content.css("div.listing_title.title_with_snippets h2").text().strip,
          :museum_site_url => BASE_PATH + museum_content.css("a").attribute("href").value,
          :museum_rating => museum_content.css("div.popRanking.wrap").text().strip,
          :museum_review_snippets => museum_content.css("div.prw_rup.prw_attractions_attractions_review_snippets").text().strip
        }
  end
 end
end