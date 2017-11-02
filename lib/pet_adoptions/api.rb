class PetAdoptions::API
  attr_accessor :pet_list, :breed_list, :pets

  def self.breed_list
    breed = RestClient.get("http://api.petfinder.com/breed.list?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog")
    @breed_list = JSON.parse(breed)
    @breed_list["petfinder"]["breeds"]["breed"].each do |animal|
      PetAdoptions::Pets.new_from_json(animal)
    end
  end

  def self.pet_list(zip_code, breed_selection) # create pets from the pet_list
    zip_code = "78721"
    breed_selection = "Alaskan%20Malamute"
    pet_list = RestClient.get("http://api.petfinder.com/pet.find?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog&location=#{zip_code}&breed=#{breed_selection}")
    @pet_list = JSON.parse(pet_list)
  end
end

# name, sex, description
# https://stackoverflow.com/questions/17375947/parsing-string-to-add-to-url-encoded-url
# @pet_list["petfinder"]["pets"]["pet"][0]["name"]
# @pet_list["petfinder"]["pets"]["pet"][0]["age"]
