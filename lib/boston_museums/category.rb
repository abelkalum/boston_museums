class BostonMuseums::Category
  attr_accessor :name, :url, :type
  attr_reader :museums, :rating, :review
  @@all = []
 def initialize(name, url, type)
  @name = name
  @url = url
  @type = type
  @rating = rating
  @review = review
  @museums = []
  @@all << self
 end
 
 def self.all
  @@all
 end
 
 def self.type(type)
    @@all.select{|category| category.type == type}
 end

 def add_museum(museum)
  self.museums << museum
  museum.category = self
 end
end