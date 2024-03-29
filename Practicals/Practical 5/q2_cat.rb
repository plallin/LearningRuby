class Cat < Felidae
  attr_accessor :name, :family, :adoptable
  def initialize(name, color, family)
    super('Felis catus', false, true, %w(Africa America Asia Europe Oceania), true, false, color, %w(plain forest human_settlements))
    @name = name
    @family = family
    @adoptable = for_adoption?
  end

  def for_adoption?
    @family == nil
  end

  def make_a_sound
    no = 1 + rand(10)
    no.times { print 'meow... purr purr purr... ' }
    puts ''
  end

end