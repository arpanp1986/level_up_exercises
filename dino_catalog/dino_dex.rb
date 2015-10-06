class Dinosaur
  attr_accessor :genus, :period, :carnivore, :weight, :walking, :continent, :description

  def initialize(genus, period, carnivore, weight, walking, continent, description)
    @genus = genus
    @period = period
    @carnivore = carnivore
    @weight = weight
    @walking = walking
    @contenent = continent
    @description = description
  end
end

# ex Dinosaur.new("x", "y", "z", "a", "b")
