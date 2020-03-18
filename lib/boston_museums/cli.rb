class BostonMuseums::CLI
  attr_reader :counter, :type
 
  def start
   puts "Welcome to Museums in Boston!"
   @counter = 0 
   menu
  end
 
  def menu
   puts "What category of museums would you like to visit today?"
   puts "Art Galleries, History Museums, Specialty Museums, Art Museums, Science Museums, Children's Museums, Military Museums, or Observatories and Planetariums"
   puts "Type either '1' for Art Galleries, '2' for History Museums, '3' for Specialty Museums, '4' for Art Museums, '5' for Science Museums, '6' for Children's Museums, '7' for Military Museums, or '8' for Observatories and Planetariums"
     input = gets.strip
     case input
       when "1"
       puts "in Art Galleries"
       @type = "Art Galleries"
       if  @counter == 0
          scrape_categories
          @counter = 1 
       end
         list_categories
         choose_category
       when "2"
       puts "in History Museums"
       @type = "History Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "3"
       puts "in Specialty Museums"
       @type = "Specialty Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "4"
       puts "in Art Museums"
       @type = "Art Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "5"
       puts "in Science Museums"
       @type = "Science Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "6"
       puts "in Children's Museums"
       @type = "Children's Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "7"
       puts "in Military Museums"
       @type = "Military Museums"
        if BostonMuseums::Category.type(@type) == []
         scrape_categories
       end
         list_categories
         choose_category
       when "8"
       puts "in Observatories and Planetariums"
       @type = "Observatories and Planetariums"
       if BostonMuseums::Category.type(@type) == []
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
 
  def scrape_categories
      categories = BostonMuseums::Scraper.scrape_categories(@type)
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
      display_category_museums(category)
    else
      puts "\nPlease put in a valid input"
      list_categories
      choose_category
    end
  end
  
  def scrape_museums
      museums = BostonMuseums::Museum.new
  end

  def display_category_museums(category)
    if BostonMuseums::Category.all == []
      scrape_museums
    end
      puts "Here are the museums in #{category}:"
      BostonMuseums::Category.all.each do |museum|
      puts "#{museum.name}"
      puts "#{museum.rating}"
      puts "#{museum.review}"
    end
end
  