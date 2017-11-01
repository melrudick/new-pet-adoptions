class PetAdoptions:CLI

  def call
    puts "Welcome to Pet Adoptions!!"
    puts "Thousands of dogs need a forever home."
    puts "Let's see who's looking for a home today:"
  end

  def menu
    input = nil
    puts "Please choose the number of the breed you would like to see:"
    breed_list
    input = gets.strip.to_i
    choice = input.to_i
    # if choice != 0 && choice.between?(1..20)
  end
end
