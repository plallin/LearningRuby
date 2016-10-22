class Felidae < Animal

  attr_accessor :color, :biomes

  def initialize(scientific_name, lethal, social, regions, domesticated, extinct, color, biome)
    super(scientific_name, true, true, lethal, social, regions, domesticated, extinct)
    @color = color
    @biomes = biomes
  end

  def where_does_it_live
    "#{scientific_name}: this felidae can be observed in its natural evironment in the following regions:"
    @regions.each{|region| puts "\t-#{region}"}

    'They tend to live in the following places:'
    @biomes.each{|biome| puts "\t-#{biome}"}
  end

end