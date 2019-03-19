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