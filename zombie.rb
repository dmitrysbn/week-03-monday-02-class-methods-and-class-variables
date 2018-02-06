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

  def self.new_day

  end

  def self.some_die_off

  end

  def self.spawn
    number_of_zombies = rand(5) + 1
    number_of_zombies.times do |i|
      i = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << i
    end
  end

  def self.increase_plague_level

  end


  ### INSTANCE METHODS ###
  def initialize(speed, strength)
    @speed = [speed, @@max_speed].min
    @strength = [strength, @@max_strength].min
  end

  def encounter

  end

  def outrun_zombie?

  end

  def survive_attack?

  end

end

# zombie1 = Zombie.new(99,99)
# puts zombie1.inspect
Zombie.spawn
puts Zombie.all.inspect
