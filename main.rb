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

def choices (choice)
	shelter = Shelter.new("HappiTails")

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
			message = 'Adding animal...'
			print "name: "; name = gets.chomp
			print "age: "; age = gets.chomp
			print "gender: "; gender = gets.chomp
			print "species: "; species = gets.chomp
			print "toys? If any... : "; toys = gets.chomp.split(", ")
			shelter.animals << Animal.new( name, age, gender, species, toys)
			message = "[ + 1 ] Animal #{name} has been added to #{shelter.name} shelter"

		when '4'
			message = 'Adding client...'
			print "name: "; client_name = gets.chomp
			print "age: "; age = gets.chomp
			print "number of kids: "; num_kids = gets.chomp
			print "number of pets: "; num_pets = gets.chomp
			new_client = Client.new( client_name, age, num_kids, num_pets)

			#adding the existing pets to the client
			i = 0
			while num_pets.to_i > i
				print "pet #{i+1}'s name: "; name = gets.chomp
				print "#{name}'s age: "; age = gets.chomp
				print "#{name}'s gender: "; gender = gets.chomp
				print "#{name}'s species: "; species = gets.chomp
				print "#{name}'s toys: "; toys = gets.chomp
				new_client.pets << Animal.new( name, age, gender, species, toys)
				i+=1

			end	

			shelter.clients << new_client
			message = "[ +1 ] Client #{client_name} has been added to #{shelter.name} shelter's database"

		when '5'
			print "Are you already a client? [yes] [no] >  "
			is_client = gets.chomp

			case is_client
			when "yes"
				print "What's your name? \n > "
				client_name = gets.chomp 

			when "no"
				print "Client's' name: "; client_name = gets.chomp
				print "#{client_name}'s age: "; age = gets.chomp
				print "#{client_name}'s number of kids: "; gender = gets.chomp
				print "#{client_name}'s number of pets: "; species = gets.chomp
				shelter.clients << Client.new( client_name, age, num_kids, num_pets)
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
				# choices('4') #why doesn't this work!! NOW THE CODE simply starts over
				print "Client's' name: "; client_name = gets.chomp
				print "#{client_name}'s age: "; age = gets.chomp
				print "#{client_name}'s number of kids: "; gender = gets.chomp
				print "#{client_name}'s number of pets: "; species = gets.chomp
				shelter.clients << Client.new( name, age, num_kids, num_pets)
			end

			print "You have the following pets: "

			#selecting the client and selecting the pets he owns
			current_client = shelter.clients.select { |person| 
					person.name == client_name }.first

			# client_pet_name = current_client.pets.map{ |pet| 
			# 		pet.name }
			# print client_pet_name + "    "

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
end

message = ""
choice = menu(message)
choices(choice)


