class Animal
  
  attr_accessor :name, :age, :gender, :species, :toys

  # initialize instance variables
  def initialize( name, age, gender, species)
  	@name = name
  	@age = age
  	@gender = gender
  	@species = species
  	@toys = []
   

  end

end