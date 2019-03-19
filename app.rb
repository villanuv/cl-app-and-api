require 'csv'
require 'date'

class Person
	attr_reader :first_name, :last_name, :gender, :color, :birthdate

	def initialize(first_name, last_name, gender, color, birthdate)
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@color = color
		@birthdate = birthdate
	end
end

class Interface
	attr_reader :data

	def initialize
		@data = []
	end

	def load_data(file)
		CSV.foreach(file) do |row|
			@data << Person.new(row[1], row[0], row[2], row[3], row[4])
		end
	end
end

interface = Interface.new
interface.load_data("people.csv")


