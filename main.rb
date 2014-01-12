require './shelter'
require './animal'
require './client'
require 'pry'

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
		message += "Client #{name} has been added to #{shelter.name} shelter's database"

	when '5'
		print "We have the following pets up for adoptions: "
		shelter.animals.each { |pet| puts pet.name + " "  }
		print "Which one would you like do adopt? > "
		clients_choice = gets.chomp
		clients_pet = shelter.animals.select { |pet| 
					pet.name == clients_choice }.first

		print "Are you already a client? [yes] [no] > "
		is_client = gets.chomp
			case is_client
			when "yes"
				print "What's your name? > "
				client_name = gets.chomp
				current_client = shelter.clients.select { |person| 
					person.name == client_name }.first
				current_client.pets << clients_pet
				
			when "no"
				choice = 4
				# selected the added client to add the animal to
			end

		shelter.animals.select { |pet| pet.name == clients_choice }.first


	when '6'

	else 
		message += "please select one of the options..."

	end
	choice = menu(message)

end