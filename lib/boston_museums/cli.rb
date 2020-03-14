class BostonMuseums::CLI
 
  def start
   puts "Welcome to Museums in Boston!"
   menu
  end
 
  def menu
   puts "What category of museums would you like to visit today?"
   puts "Art Galleries, History Museums, Specialty Museums, Art Museums, or Science Museums"
   puts "Type either '1' for Art Galleries, '2' for History Museums, '3' for Specialty Museums, '4' for Art Museums, or '5' for Science Museums"
     input = gets.strip
     case input
       when "1"
       puts "in Art Galleries"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         display_category_museums('Art Galleries')
       when "2"
       puts "in History Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         display_category_museums('History Museums')
       when "3"
       puts "in Specialty Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         display_category_museums('Specialty Museums')
       when "4"
       puts "in Art Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         display_category_museums('Art Museums')
       when "5"
       puts "in Science Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         display_category_museums('Science Museums')
       when "exit"
         puts "Goodbye!"
       else
         puts "Invalid"
         menu
       end
    end
 
  def scrape_categories
      categories = BostonMuseums::Scraper.scrape_categories(@category)
    end
  end

  def display_category_museums(category)
    if BostonMuseums::Category.all == []
      scrape_categories
    end
      puts "Here are the museums in #{category}:\n"
      BostonMuseums::Category.all.each do |museum|
        puts "#{museums}"
        puts "#{museum_reviews}"
        puts "#{museum_ratings}"
    end
end
  