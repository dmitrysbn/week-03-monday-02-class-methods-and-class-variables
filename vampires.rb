class Vampire
  @@coven = []

  def self.create(name, age)
    vampire = Vampire.new(name, age)
    @@coven << vampire
    return vampire
  end

  def self.coven
    @@coven
  end

  def self.sunrise
    alive_vampires = @@coven.select do |vampire|
      vampire.in_coffin == true && vampire.drank_blood_today == true
    end
    @@coven = alive_vampires
  end

  def self.sunset
    reset_coven_stats = @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
    end
    @@coven = reset_coven_stats
  end

  ## INSTANCE METHODS ##
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def in_coffin
    @in_coffin
  end

  def in_coffin=(status)
    @in_coffin = status
  end

  def drank_blood_today
    @drank_blood_today
  end

  def drank_blood_today=(status)
    @drank_blood_today = status
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end
end

vampire1 = Vampire.create("Dmitry", 666)
puts vampire1.inspect
vampire1.drink_blood
vampire1.go_home

puts "Make more vampires."
5.times do
  Vampire.create(rand(6), rand(600))
end
puts Vampire.coven
puts "Sunrise!"
Vampire.sunrise
puts Vampire.coven.inspect

puts "Make more vampires."
5.times do
  Vampire.create(rand(6), rand(600))
end
puts Vampire.coven

puts "Sunset!"
Vampire.sunset
puts Vampire.coven

puts "Sunrise!"
Vampire.sunrise
puts Vampire.coven.inspect
