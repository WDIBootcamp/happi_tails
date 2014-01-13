class Client
  
  attr_accessor :name, :age, :num_kids, :num_pets, :pets

  # initialize instance variables
  def initialize( name, age, num_kids, pets)
  	@name = name
  	@age = age
  	@num_kids = num_kids
  	@num_pets = num_pets
  	@pets = []

  end
  

end