class BostonMuseums::CLI
  BASE_PATH = "https://www.tripadvisor.com"
  attr_accessor :museum_list_url

  def run
    make_museums
    puts "Welcome to Museums of Boston!".bold.colorize(:green)
    puts " "
    puts "You want to know more about the museums?! Type 'Yes'".bold.colorize(:green)
    puts " "
    puts "Type 'Exit' to leave program.".bold.colorize(:green)
    input = gets.chomp
    if input.capitalize != "Exit"
      user_input_loop
    end
  end

  def user_input_loop
    loop do
      puts " "
      puts "Here are the top-rated Museums in Boston:".bold.colorize(:green)
      list_museums
      museum_details
      puts "Want to learn about another museum? Type 'Yes'".bold.colorize(:green)
      puts "Type 'Exit' to leave menu.".bold.colorize(:green)
      input = gets.chomp
      if input.capitalize == "Exit"
        break
      elsif input.capitalize != "Yes"
        puts "Invalid entry but let us learn more anyway!".bold.colorize(:red)
      end
    end
  end

  def make_museums
    museum_array = BostonMuseums::Scraper.scrape_index_page(BASE_PATH + "/Attractions-g60745-Activities-c49-Boston_Massachusetts.html")
    BostonMuseums::Museum.create_from_array(museum_array)
  end

  def list_museums
    museum_alphabetical = BostonMuseums::Museum.all.sort_by {|museum| museum.name}
    museum_alphabetical.each.with_index(1) {|museum, index| puts "#{index}. #{museum.name}"}
  end

  def museum_details 
    puts "Please enter the number of the museum you would like to learn more about:".bold.colorize(:blue)
    input = gets.chomp.to_i
      if (1..30).include?(input)
        @chosen_museum = BostonMuseums::Museum.all.sort_by {|museum| museum.name}[input - 1]
        puts " "
        puts "#{@chosen_museum.name}"
        puts " "
        puts "#{@chosen_museum.museum_site_url}"
        puts " "
        puts "#{@chosen_museum.museum_rating}"
        puts " "
        puts "#{@chosen_museum.museum_review_snippets}"
        puts " "
        puts "Want to learn even more? Visit the Museum Page!".bold.colorize(:blue)
        puts " "
        puts "#{@chosen_museum.museum_site_url}".bold.colorize(:purple)
      elsif (1..30).include?(input) == false
        puts "Ooops... That's not right.".bold.colorize(:red)
      end
   end
end