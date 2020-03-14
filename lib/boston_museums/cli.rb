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
         scrape_art_galleries
       end
         list_categories
         choose_category
       when "2"
       puts "in History Museums"
       if BostonMuseums::Category.all == []
         scrape_history_museums
       end
         list_categories
         choose_category
       when "3"
       puts "in Specialty Museums"
       if BostonMuseums::Category.all == []
         scrape_specialty_museums
       end
         list_categories
         choose_category
       when "4"
       puts "in Art Museums"
       if BostonMuseums::Category.all == []
         scrape_art_galleries
       end
         list_categories
         choose_category
       when "5"
       puts "in Science Museums"
       if BostonMuseums::Category.all == []
         scrape_science_museums
       end
         list_categories
         choose_category
       when "exit"
         puts "Goodbye!"
       else
         puts "Invalid"
         menu
       end
    end
 
  def list_categories
    BostonMuseums::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

  def choose_category
    puts "\nChoose a category by selecting a number:"
    input = gets.strip.to_i
    max_value = BostonMuseums::Category.all.length
    if input.between?(1,max_value)
      category = BostonMuseums::Category.all.length[input-1]
      display_category_items(category)
    else
      puts "\nPlease put in a valid input"
      list_categories
      choose_category
    end
  end

  def display_category_museums(category)
    if category.museums == []
      BostonMuseums::Scraper.scrape_museums(category)
    end
      puts "Here are the museums in #{category.name}:\n"
      category.museums.each.with_index(1) do |museum, index|
        puts "\n#{index}. #{museum.name}"
        puts "#{museum_reviews}"
        puts "#{museum_rating}"
      end
    end
  end

def scrape_art_galleries
  category = "Art Galleries"
  category.url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-t1-Boston_Massachusetts.html"
  BostonMuseums::Scraper.scrape_art_galleriess(category.url)
end

def scrape_history_museums
  category = "History Museums"
  category.url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-t30-Boston_Massachusetts.html" 
  BostonMuseums::Scraper.scrape_history_museums(category.url)
end

def scrape_specialty_museums
  category = "Specialty Museums"
  category.url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-t161-Boston_Massachusetts.html" 
  BostonMuseums::Scraper.scrape_specialty_museums(category.url)
end

def scrape_art_museums
  category = "Art Museums"
  category.url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-t28-Boston_Massachusetts.html"
  BostonMuseums::Scraper.scrape_art_museum(category.url)
end

def scrape_science_museums
  category = "Science Museums"
  category.url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-t35-Boston_Massachusetts.html" 
  BostonMuseums::Scraper.scrape_science_museum(category.url)
end