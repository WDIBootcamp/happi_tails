require './shelter'
require './animal'
require './client'

shelter = Shelter.new("HappiTails")

def menu (message)
	puts `clear`
	puts "*** Managing your Animal Shelter ***\n\n"

	puts "#{message}\n\n" unless message.empty?

	puts '1 : display all animals'
	puts '2 : display all clients'
	puts '3 : add an animal'
	puts '4 : add a client'
	puts "5 : facilitate client's pet adoption"
	puts "6 : faciliate client's pet put up for adoption"
	puts 'q : Quit'
	puts '-->'
	puts 
	gets.chomp

end

message =""
choice = menu(message)

while choice != 'q'
	message = ""
	case choice

	when '1'
		message = "The animals in the shelter are: "
		shelter.animals.each { |pet| message += pet.name + " "  }
	when '2'
		message = "The current clients of this shelter are: n/"
		shelter.clients.each { |client| message += client.name + " "  }

	when '3'
		print "name: "; name = gets.chomp
		print "age: "; age = gets.chomp
		print "gender: "; gender = gets.chomp
		print "species: "; species = gets.chomp
		print "toys? If any... : "; toys = gets.chomp.split(", ")
		shelter.animals << Animal.new( name, age, gender, species, toys)
		message += "Animal #{name} has been added to #{shelter.name} shelter"

	when '4'
		print "name: "; name = gets.chomp
		print "age: "; age = gets.chomp
		print "number of kids: "; num_kids = gets.chomp
		print "number of pets: "; num_pets = gets.chomp
		shelter.clients << Client.new( name, age, num_kids, num_pets)
		message += "Animal #{name} has been added to #{shelter}"

	when '5'
		print "We have the following pets up for adoptions: "
		puts shelter.animals.select.map { |pet| pet.name  }

	when '6'

	else 
		message += "please select one of the options..."

	end
	choice = menu(message)

end