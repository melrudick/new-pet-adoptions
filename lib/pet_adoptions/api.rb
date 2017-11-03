class PetAdoptions::API
  attr_accessor :pet_list, :breed_list, :pets

  def self.breed_list
    breed = RestClient.get("http://api.petfinder.com/breed.list?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog")
    @breed_list = JSON.parse(breed)
    @breed_list["petfinder"]["breeds"]["breed"].each.with_index(1) do |index, dogs|
      puts "#{index["$t"]}. #{dogs}"
    end
  end

  def self.pet_list(zip_code, breed_selection)
    # zip_code = "78721"
    # breed_selection = "Alaskan%20Malamute" 
    pet_list = RestClient.get("http://api.petfinder.com/pet.find?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog&location=#{zip_code}&breed=#{breed_selection}")
    @pet_list = JSON.parse(pet_list)
    @pet_list["petfinder"]["pets"]["pet"].each do |dog|
      PetAdoptions::Pets.new_from_json(dog) # right now, pet_list is all dogs with all properties .. too many details
      # need to understand line 18, and understand why 17 isn't working
      # error message: 'pet_list undefined method [] for nil"NilClass'

    end
  end
end
