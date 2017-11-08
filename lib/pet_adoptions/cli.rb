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
    PetAdoptions::API.get_breed_list
    choice = gets.strip.to_i-1
    breed = PetAdoptions::API.breed_list[choice]["$t"]

    PetAdoptions::API.get_pet_list(zip, breed)
    if choice != 0
      dog_list = PetAdoptions::Pets.find(choice)
      dog_specs(dog_list)
    else
      puts "Please try again."
    end
  end

  # def list_dogs
  #   PetAdoptions::Pets.all.each.with_index(1) do |index, dog|
  #     puts "#{index}. #{dog.name} - #{dog.sex} - #{dog.age}"
  #   end
  # end

  def dog_specs(dog_list)
    puts "_____#{dog_list.name}_____"
    puts "Sex: #{dog_list.sex}"
    puts "Age: #{dog_list.age}"
    puts "About: #{dog_list.description}"
  end

  # def extra_details(dog_list)
  #   puts "#{dog_list.name}: Description: #{dog_list.description}"
  # end
end


# pet_list # create pets from the pet_list
