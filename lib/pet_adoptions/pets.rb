class PetAdoptions::Pets
  attr_accessor :name, :sex, :description

  @@all = []

  def initialize(name, sex, description, age)
    @name = name
    @sex = sex
    @description = description
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_json(pet_data)
    self.new(
    pet_data["name"],
    pet_data["sex"],
    pet_data["description"],
    pet_data["age"]
    )
  end
end
