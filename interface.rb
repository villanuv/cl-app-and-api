require 'csv'

class Interface
	attr_reader :data

	def initialize
		@data = []
	end

	def load_data(file)
		CSV.foreach(file) do |row|
			data_string = row[0]
			if data_string.include? '|'
				info = data_string.split(" | ")
				@data << Person.new(info[1], info[0], info[2], info[3], info[4])				
			elsif data_string.include? ' '
				info = data_string.split(" ")
				@data << Person.new(info[1], info[0], info[2], info[3], info[4])
			else
				@data << Person.new(row[1], row[0], row[2], row[3], row[4])
			end
		end
	end

	def sort_by_gender_and_last_name
		@data.sort_by{ |person| [person.gender, person.last_name] }
	end
end