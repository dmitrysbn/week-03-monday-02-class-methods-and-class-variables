class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  ### CLASS METHODS ###
  def self.all
    @@horde
  end

  def self.plague_level
    @@plague_level
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def self.some_die_off
    number_to_die = rand(11)
    if number_to_die > @@horde.size
      @@horde = []

    else
      #This is to make sure that random zombies die off
      number_to_die.times do
        @@horde.delete_at(rand(@@horde.size) % @@horde.size)
      end
    end
  end

  def self.spawn
    number_of_zombies = rand(20) + 1
    number_of_zombies.times do |i|
      i = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << i
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end


  ### INSTANCE METHODS ###
  def initialize(speed, strength)
    @speed = [speed, @@max_speed].min
    @strength = [strength, @@max_strength].min
  end

  def encounter
    if self.outrun_zombie?
      puts "You escaped!"

    elsif self.survive_attack?
      zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << zombie
      puts "You've turned into a zombie!"

    else
      puts "You died."
    end
  end

  def outrun_zombie?
    if rand(@@max_speed) > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    if rand(@@max_strength) > @strength
      true
    else
      false
    end
  end

end

10.times do
  Zombie.spawn
end

# puts Zombie.all.inspect
puts Zombie.all.size
Zombie.some_die_off
Zombie.new_day
# puts Zombie.plague_level
puts Zombie.all.size
zombie1 = Zombie.new(4,2)
zombie1.encounter
puts Zombie.all.size

# 5.times do
#   Zombie.increase_plague_level
# end
