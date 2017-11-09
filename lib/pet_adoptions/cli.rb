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
    dog_list = PetAdoptions::Pets.all
    list_all_dogs(dog_list, breed)
    puts ""
    puts "Would you like to see another breed? Enter Y or N:"
    input = gets.strip.downcase
    if input == "y"
      menu
    else
      puts ""
      puts "Thank you for searching!"
      puts "Goodbye!"
    end
  end

  def list_all_dogs(dog_list, breed)
    dog_list.each do |dog|
      dog_specs(dog, breed)
    end
  end

  def dog_specs(dog, breed)
    puts "_____#{dog.name}_____"
    puts "#{breed}"
    puts "Sex: #{dog.sex}"
    puts "Age: #{dog.age}"
    if dog.description != nil
      puts "About: #{dog.description}"
    end
    puts ""
  end
end
