class FlyweightStrategy < Strategy
  attr_reader :flyweight_factory, :character_factory

  def initialize(flyweight_factory, character_factory)
    @flyweight_factory = flyweight_factory
    @character_factory = character_factory
  end

  def calculate_stats

  end
end
