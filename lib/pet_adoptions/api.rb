

class PetAdoptions::API
  attr_accessor :pet_list, :breed_list

  def self.breed_list
    breed = RestClient.get("http://api.petfinder.com/breed.list?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog")
    binding.pry
    @breed_list = JSON.parse(breed)
    @breed_list["breeds"]["breed"].each do |animal|
      PetAdoptions::Pets.new_from_json(animal)
    end
  end

  def self.pet_list(zip_code, breed_selection)
    zip_code = "78721"
    breed_selection = "Alaskan%20Malamute"
    pet_list = RestClient.get("http://api.petfinder.com/pet.find?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog&location=#{zip_code}&breed=#{breed_selection}")
    @pet_list = JSON.parse(pet_list)
  end
end

# name, sex, description
