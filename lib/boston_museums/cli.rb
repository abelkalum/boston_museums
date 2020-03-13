class BostonMuseums::CLI
 
  def start
   puts "Welcome to Museums in Boston!"
   menu
  end
 
  def menu
   puts "What category of museums would you like to visit today?"
   puts "Art Galleries, History Museums, Specialty Museums, Art Museums, Science Museums, Children's Museums, Military Museums, or Observatories and Planetariums"
   puts "Type either '1' for Art Galleries, '2' for History Museums, '3' for Specialty Museums, '4' for Art Museums, '5' for Science Museums, '6' for Children's Museums, 7' for Military Museums, or '8' for Observatories and Planetariums"
     input = gets.strip
     case input
       when "1"
       puts "in Art Galleries"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "2"
       puts "in History Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "3"
       puts "in Specialty Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "4"
       puts "in Art Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "5"
       puts "in Science Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "6"
       puts "in Children's Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "7"
       puts "in Military Museums"
       if BostonMuseums::Category.all == []
         scrape_categories
       end
         list_categories
         choose_category
       when "8"
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