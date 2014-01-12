class Animal
  
  attr_accessor :name, :age, :gender, :species, :toys, :owner

  # initialize instance variables
  def initialize(name, age, gender, species, toys=[])
  	@name = name
  	@age = age
  	@gender = gender
  	@species = species
  	@toys = []
  	@owner = ""
  
  end

end