class PetAdoptions::Pets
  attr_accessor :name, :sex, :description, :age

  @@all = []

  def self.new_from_json(pet_data)
    self.new(
    pet_data["name"]["$t"],
    pet_data["sex"]["$t"],
    pet_data["description"]["$t"],
    pet_data["age"]["$t"]
    )
  end

  def initialize(name, sex, description, age)
    @name = name
    @sex = sex
    @description = description
    @age = age
    # binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(dog)
   self.all[dog-1]
 end

end
