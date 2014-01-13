class Shelter
  
  attr_accessor :name, :clients, :animals

  # initialize instance variables
  def initialize(name)
   @name = name
   @clients = []
   @animals = []

  end

  def clients_details
    i=0
    clients_string = ""

    while i < @clients.length
      client_name = @clients[i].name
      client_pets = @clients[i].pets.select.map { |pet| pet.name }.join(", ")
      if client_pets == ""
        client_pets = "no pets"
      end
      clients_string << "> #{client_name}: #{client_pets}\n"
      i+=1

    end

    return clients_string     

  end
  
  def animals_details
  	@animals.inject("") do |animal_list, animal|
		animal_list << "> #{animal.name}: #{animal.species}: #{animal.age} years-old: #{animal.gender}\n"
	  end	
    
  end


end