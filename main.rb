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
	puts 'q : Quit\n\n'
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
		message = "The available animals in the shelter are: n/"
		message += shelter.animals() + " " #check to see if this will print out nicely 

	when '2'
		message = "The current clients of this shelter are: n/"
		message += shelter.clients() + " "

	when '3'
		print "name: "; name = gets.chomp
		print "age: "; age = gets.chomp
		print "gender: " gender = gets.chomp
		print "species: " species = gets.chomp
		print "toys? If any... : " toys = gets.chomp.split (", ")
		shelter.animals << new.Animal( name, age, gender, species, toys)
		message += "Animal #{name} has been added to #{shelter}"

	when '4'
		print "name: "; name = gets.chomp
		print "age: "; age = gets.chomp
		print "number of kids: " num_kids = gets.chomp
		print "number of pets: " num_pets = gets.chomp
		shelter.clients << new.Client( name, age, num_kids, num_pets)
		message += "Animal #{name} has been added to #{shelter}"

	when '5'
		print ""

	when '6'

	else 
		message += "please select one of the options..."

	end
	choice = menu(message)

end