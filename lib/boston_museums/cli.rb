class BostonMuseums::CLI
  attr_reader :counter
  
  def start
   puts "Welcome to Museums in Boston‎!"
   @counter = 0 
   menu
  end
  
  def menu
   puts "What category of museums would you like to visit today?"
   puts "Art Galleries, History Museums, Specialty Museums, Art Museums, Science Museums, Children's Museums, Military Museums, or Observatories and Planetariums"
   puts "Type either 'Art Galleries', 'History Museums', 'Specialty Museums', 'Art Museums', 'Science Museums', 'Children's Museums', 'Military Museums', or 'Observatories and Planetariums'"
   input = gets.strip.capitalize
   case input
     when "Art Galleries"
      puts "in Art Galleries"
      if  @counter == 0
        scrape_categories
        @counter = 1
      end 
        list_categories
        choose_category
     when "History Museums"
      puts "in History Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Specialty Museums"
      puts "in Specialty Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Art Museums"
      puts "in Art Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Science Museums"
      puts "in Science Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Children's Museums"
      puts "in Children's Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Military Museums"
      puts "in Military Museums"
      if BostonMuseums::Category.all == []
        scrape_categories
      end
        list_categories
        choose_category
     when "Observatories and Planetariums"
      puts "in Observatories and Planetariums"
      if BostonMuseums::Category.all == []
        scrape_categories
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

  def scrape_categories
      categories = BostonMuseums::Scraper.scrape_categories(url)
  end
 end