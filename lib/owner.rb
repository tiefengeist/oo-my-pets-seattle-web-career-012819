class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].map do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    pets[:cats].map do |kittycat|
      kittycat.mood = 'happy'
    end
  end

  def feed_fish
    pets[:fishes].map do |fishies|
      fishies.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |animal, pets|
      pets.each do |pet|
        pet.mood = 'nervous'
      end
    end
    @pets.clear
  end


  def list_pets
    dog_count = @pets[:dogs].count
    cat_count = @pets[:cats].count
    fish_count = @pets[:fishes].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
