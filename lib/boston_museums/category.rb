class BostonMuseums::Category
  attr_accessor :name, :url, :rating, :review
  attr_reader :museums
  @@all = []
 def initialize(name)
  @name = name
  @url = url
  @review = review
  @rating = rating
  @museums = []
  @@all << self
 end
 
 def self.all
  @@all
 end
 
 def self.category(category)
    @@all.select{|category| category == category}
 end

 def add_museum(museum)
  self.museums << museum
  museum.category = self
 end
end