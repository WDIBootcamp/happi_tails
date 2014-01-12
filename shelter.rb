class Shelter
  
  attr_accessor :name, :clients, :animals

  # initialize instance variables
  def initialize(name)
   @name = name
   @clients = []
   @animals = []

  end
  
end