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
			message += "#{shelter.clients_details}\n"

		when '3'
			print "name: "; name = gets.chomp
			print "age: "; age = gets.chomp
			print "gender: "; gender = gets.chomp
			print "species: "; species = gets.chomp
			print "toys? If any... : "; toys = gets.chomp.split(", ")
			shelter.animals << Animal.new( name, age, gender, species, toys)
			message += "[ + 1 ] Animal #{name} has been added to #{shelter.name} shelter"

		when '4'
			print "name: "; name = gets.chomp
			print "age: "; age = gets.chomp
			print "number of kids: "; num_kids = gets.chomp
			print "number of pets: "; num_pets = gets.chomp
			new_client = Client.new( name, age, num_kids, num_pets)
			shelter.clients << new_client
			message += "[ +1 ] Client #{name} has been added to #{shelter.name} shelter's database"

		when '5'
			print "We have the following pets up for adoptions:\n"
			puts shelter.animals_details
			print "Which one would you like do adopt? > "
			clients_choice = gets.chomp
			clients_pet = shelter.animals.select { |pet| 
						pet.name == clients_choice }.first

			# catch(:redo) do
				print "Are you already a client? [yes] [no] >  "
				is_client = gets.chomp
				case is_client
				when "yes"
					print "What's your name? \n > "
					client_name = gets.chomp 
					current_client = shelter.clients.select { |person| 
						person.name == client_name }.first
					current_client.pets << clients_pet
				message += "#{clients_choice} was adopted by #{client_name}!"
				binding.pry

				when "no"
					message += 'select [4] to add the client'	
					# choices('4') 
					#why doesn't this work!! NOW THE CODE simply starts over
					
					# redo 
					# how to run what comes after this method call
				 #    current_client = shelter.clients.select { |person| 
					# 	person.name == name }.first
					# current_client.pets << clients_pet

					
				end

		when '6'
			print "Are you already a client? [yes] [no] >  "
			is_client = print gets.chomp
			case is_client
			when "yes"
				print "What's your name? > "
				client_name = gets.chomp 
				print "\nWhat pet do you want to adopt? > "
				pet_up4_adoption = gets.chomp
				selected_client = shelter.clients.select { |client| 
					client.name == client_name }.first
				selected_pet = selected_client.pets.select { |pet| pet.name == pet_up4_adoption}
				shelter.animals << selected_pet
			when "no"
				message += 'select [4] to add the client'	
				# choices('4') #why doesn't this work!! NOW THE CODE simply starts over
			end

			else 
				message += "please select one of the options..."

		end
		choice = menu(message)

	end
end

message = ""
choice = menu(message)
choices(choice)


