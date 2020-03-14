class BostonMuseums::Category
  attr_accessor :name, :url
  attr_reader :museums
  @@all = []
 def initialize(name, url)
  @name = name
  @url = url
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