class Shelter
  
  attr_accessor :name, :clients, :animals

  # initialize instance variables
  def initialize(name)
   @name = name
   @clients = []
   @animals = []

  end

  def clients_details
	 @clients.inject("") do |clients_list, client|
 		clients_pet_names = client.pets.inject("") { |pet_str, pet_name| 
 			pet_str == "#{pet_name.name}, " }
      	clients_list << "> #{client.name}: #{clients_pet_names} \n " 
	  end
  end
  
  def animals_details
  	@animals.inject("") do |animal_list, animal|
		animal_list << "> #{animal.name}: #{animal.species}: #{animal.age} years: #{animal.gender}\n"
	end	
  end


end