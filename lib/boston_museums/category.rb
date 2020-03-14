class BostonMuseums::Category
  attr_accessor :name
  attr_reader :museums
  @@all = []
 def initialize(name)
  @name = name
  @museums = []
  @art_galleries = []
  @history_museums = []
  @specialty_museums = []
  @art_museums = []
  @science_museums = []
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