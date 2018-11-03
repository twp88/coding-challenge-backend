class ParseZombieSearchResultsService
  def initialize(zombies)
    @zombies = zombies
  end

  def call

  end

  private

  def create_array_for_each_zombie
    @return_array = @zombies.
  end

  def find_each_zombie
    @zombies.map { |z| z.id }
  end
end
