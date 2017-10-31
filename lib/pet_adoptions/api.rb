class PetAdoptions::API
  attr_accessor :pets

  def self.pet_list
    pet = RestClient.get("http://api.petfinder.com/pet.getRandom?format=json?key=5155468caa12a7461aa6741c8b7a35f9")
    binding.pry
    @pet_list = JSON.parse(pets)
    @pet_list["results"].each do |animal|
      PetAdoptions::Pet.new_from_json(animal)
    end
  end
end
