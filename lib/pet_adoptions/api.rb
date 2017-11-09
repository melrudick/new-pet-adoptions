class PetAdoptions::API

  def self.get_breed_list
    breed = RestClient.get("http://api.petfinder.com/breed.list?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog")
    @@breed_list = JSON.parse(breed)["petfinder"]["breeds"]["breed"]
    @@breed_list.each.with_index(1) do |index, dog_breed|
      puts "#{dog_breed}. #{index["$t"]}"
    end
  end

  def self.breed_list
    @@breed_list
  end

  def self.pet_list
    @@pet_list
  end

  def self.get_pet_list(zip_code, breed_selection)
    breed = URI::encode(breed_selection)
    url = "http://api.petfinder.com/pet.find?format=json&key=5155468caa12a7461aa6741c8b7a35f9&animal=dog&location=#{zip_code}&breed=#{breed}"
    pet_list = RestClient.get(url)
    @pet_list = JSON.parse(pet_list)["petfinder"]["pets"]["pet"]
    if @pet_list != nil
    @pet_list.collect do |dog|
      PetAdoptions::Pets.new_from_json(dog)
    end
    else
      puts "No dogs are available of that breed."
      puts "Please make another selection."
      PetAdoptions::CLI.new.menu
    end
  end
end
