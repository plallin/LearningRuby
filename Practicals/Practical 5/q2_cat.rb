class Cat < Felidae
  attr_accessor :name, :family, :adoptable
  def initialize(color, name, family)
    super('Felis catus', false, true, %w(Africa America Asia Europe Oceania), true, false, color, %w(plain forest human_settlements))
    @name = name
    @family = family
    @adoptable = for_adoption?
  end

  def for_adoption?
    @family == nil
  end

end