require './person'
require './interface'

interface = Interface.new
interface.load_data("people.csv")
interface.load_data("people_pipe.csv")
interface.load_data("people_space.csv")

puts "Sort People Database:\n1) By Gender and Last Name\n2) By Birthdate\n3) By Last Name (DESC)"
print "Choose option > "
option = gets.chomp.to_i
if option == 1
	interface.print_records(interface.sort_by_gender_and_last_name)
elsif option == 2
	interface.print_records(interface.sort_by_birthdate)
elsif option == 3
	interface.print_records(interface.sort_by_last_name_desc)
else
	puts "Try again"
end