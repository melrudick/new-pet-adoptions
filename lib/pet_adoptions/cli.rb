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
    # choice = input.to_i
    # if choice != 0 && choice.between?(1..20)
  end
end


# pet_list # create pets from the pet_list
