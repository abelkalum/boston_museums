class BostonMuseums::Category
  attr_accessor :name, :url
  attr_reader :museums
  @@all = []
 def initialize(name)
  @name = name
  @url = url
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