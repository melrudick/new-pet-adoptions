class PetAdoptions::Pets
  attr_accessor :name, :sex, :description, :age

  @@all = []

  def self.new_from_json(pet_data)
    self.new(
    pet_data["name"]["$t"],
    pet_data["sex"]["$t"],
    pet_data["age"]["$t"],
    pet_data["description"]["$t"]
    )
  end

  def initialize(name, sex, age, description)
    @name = name
    @sex = sex
    @age = age
    @description = description
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
