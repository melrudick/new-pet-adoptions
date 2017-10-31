

class PetAdoptions::API
  attr_accessor :pet_list

  def self.pet_list
    pets = RestClient.get("http://api.petfinder.com/pet.getRandom?format=json?key=5155468caa12a7461aa6741c8b7a35f9")
    binding.pry
    @pet_list = JSON.parse(pets)
    @pet_list["results"].each do |animal|
      PetAdoptions::Pet.new_from_json(animal)
    end
  end
end

=> true
# t=json?key=5155468caa12a7461aa6741c8b7a35f9")i.petfinder.com/pet.getRandom?forma
# => <RestClient::Response 200 "<?xml versi...">
# 2.3.1 :005 > JSON.parse(pets)
# JSON::ParserError: 765: unexpected token at '<?xml version="1.0" encoding="iso-8859-1"?>
# <petfinder xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://api.petfinder.com/schemas/0.9/petfinder.xsd">
# <header>
#  <version>0.1</version>
#  <timestamp>2017-10-31T21:42:33Z</timestamp>
#  <status>
#   <code>300</code>
#   <message>unauthorized key</message>
#  </status>
# </header>
# </petfinder>
# from /usr/local/rvm/gems/ruby-2.3.1/gems/json-2.1.0/lib/json/common.rb:156:in `parse'
#        from /usr/local/rvm/gems/ruby-2.3.1/gems/json-2.1.0/lib/json/common.rb:156:in `parse'
#        from (irb):5
#        from /usr/local/rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
