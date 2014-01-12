class Client
  
  attr_accessor :name, :age, :num_kids, :num_pets, :pets

  # initialize instance variables
  def initialize( name, age, num_kids, num_pets)
  	@name = name
  	@age = age
  	@num_kids = num_kids
  	@num_pets = num_pets
  	@pets = []

  end
  
  def adopt

  end

  def put_up_for_adoption (animal)

  end


end