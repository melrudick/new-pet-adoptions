class PetAdoptions::CLI

  def call
    puts "Welcome to Pet Adoptions!!"
    puts "Thousands of dogs need a forever home."
    puts "Let's see who's looking for a home today:"
    menu
  end

  def menu
    input = ""
    puts "Please enter your zip code:"
    zip = gets.strip.to_i
    puts "Please choose the number of the breed you would like to see:"
    PetAdoptions::API.breed_list
    breed = gets.strip.to_i
    PetAdoptions::API.pet_list(zip, breed)
    choice = input.to_i
    if choice != 0
      dog_list = PetAdoptions::Pets.find(choice)
      dog_specs(dog_list)
    end
  end

  def list_dogs
    PetAdoptions::Pets.all.each.with_index(1) do |dog, index|
      puts "#{index}. #{dog.name} - #{dog.sex} - #{dog.age}"
    end
  end

  def dog_specs(dog_list)
    binding.pry
    puts "_____#{dog_list.name}_____"
    puts "Sex: #{dog_list.sex}"
    puts "Age: #{dog_list.age}"
  end
end


# pet_list # create pets from the pet_list
