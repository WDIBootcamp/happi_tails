require './shelter'
require './animal'
require './client'
require 'pry'

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

def create_client(shelter)

	message = 'Adding client...'
	print "Client's name: "; client_name = gets.chomp
	print "#{client_name}'s age: "; age = gets.chomp
	print "#{client_name}'s number of kids: "; num_kids = gets.chomp
	print "#{client_name}'s number of pets: "; num_pets = gets.chomp
	new_client = Client.new( client_name, age, num_kids, num_pets)
	i = 0
	while num_pets.to_i > i
		clients_pet = create_pet(shelter)
		new_client.pets << clients_pet
		i+=1
	end

	return new_client

end

def create_pet(shelter)
	print "Pet's name: "; name = gets.chomp
	print "#{name}'s age: "; age = gets.chomp
	print "#{name}'s gender: "; gender = gets.chomp
	print "#{name}'s species: "; species = gets.chomp
	print "#{name}'s toys? If any... : "; toys = gets.chomp.split(", ")
	new_animal = Animal.new( name, age, gender, species, toys)
	return new_animal

end
	



shelter = Shelter.new("HappiTails")
message = ""
choice = menu(message)

while choice != 'q'
	message = ""

	case choice

	when '1'
		message = "The animals in the shelter are: \n"
		message += "#{shelter.animals_details}\n"
	when '2'
		message = "The current clients of this shelter are: \n"
		message += "#{shelter.clients_details}"

	when '3'
		pet = create_pet(shelter)
		shelter.animals << pet
		message = "[ + 1 ] Animal #{pet.name} has been added to #{shelter.name} shelter"

	when '4'
		client = create_client(shelter)
		shelter.clients << client

		message = "[ +1 ] Client #{client.name} has been added to #{shelter.name} shelter's database"

	when '5'
		print "Are you already a client? [yes] [no] >  "
		is_client = gets.chomp

		case is_client
		when "yes"
			print "What's your name? \n > "
			client_name = gets.chomp 

		when "no"
			client_name = create_client(shelter).name
		end

		print "We have the following pets up for adoptions:\n"
		puts shelter.animals_details
		print "Which one would you like do adopt? > "
		clients_choice = gets.chomp

		clients_pet = shelter.animals.select { |pet| 
					pet.name == clients_choice }.first

		current_client = shelter.clients.select { |person| 
			person.name == client_name }.first

		# adding the chosen pet object to the client's pets array
		current_client.pets << clients_pet

		# removing animal from shelter
		shelter.animals.delete(clients_pet)

		message = "#{clients_choice} was adopted by #{client_name}!"

	when '6'
		print "Are you already a client? [yes] [no] >  "
		is_client =  gets.chomp

		case is_client
		when "yes"
			print "What's your name? > "
			client_name = gets.chomp 

		when "no"
			client_name = create_client(shelter).name
		end

		print "You have the following pets: "

		#selecting the client and selecting the pets he owns
		current_client = shelter.clients.select { |person| 
				person.name == client_name }.first


		client_pets = current_client.pets.select.map { |pet| pet.name }.join(", ")
		print client_pets

		print "\nWhat pet do you want to put up for adopt? > "
		pet_4_adopt = gets.chomp

		selected_pet = current_client.pets.select { |pet| pet.name == pet_4_adopt }.first
		shelter.animals << selected_pet

		# remove animal from client
		current_client.pets.delete(selected_pet)

		message = "#{selected_pet.name} is now up for adoption."

	else 
		message = "please select one of the options..."

	end
	choice = menu(message)

	end



