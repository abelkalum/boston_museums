class BostonMuseums::Category
  attr_accessor :name, :urL
  attr_reader :museums
  @@all = []
 def initialize(name, url)
  @name = name
  @url = "https://www.tripadvisor.com/Attractions-g60745-Activities-c49-Boston_Massachusetts.html"
  @museums = [] 
  @@all << self
 end

 def self.all
  @@all
 end

 def add_museum(museum)
  self.museums << museum
  museum.category = self
 end
end