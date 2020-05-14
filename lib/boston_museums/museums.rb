class BostonMuseums::Museums

  attr_accessor :name, :museum_site_url, :museum_rating, :museum_review_snippets 

  @@all = []

  def initialize(museum_hash)
    museum_hash.each_pair {|key, value| self.send(("#{key}="), ("#{value}"))}
    @@all << self
  end

  def self.create_from_array(museum_array)
    museum_array.each { |museum_hash| self.new(museum_hash)}
  end

  def self.all
    @@all
  end

end