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

	def json_to_person(string)
		if string.include? '|'
			row = string.split(" | ")
		elsif string.include? ' '
			row = string.split(" ")
		else
			row = string.split(",")
		end
		@data << Person.new(row[1], row[0], row[2], row[3], row[4])
	end

	def sort_by_gender_and_last_name
		@data.sort_by{ |person| [person.gender, person.last_name] }
	end

	def sort_by_birthdate
		@data.sort_by{ |person| person.birthdate }
	end

	def sort_by_last_name_desc
		@data.sort_by{ |person| person.last_name }.reverse
	end

	def print_records(data)
		data.each{ |person| puts "#{person.first_name} #{person.last_name}, #{person.gender} - #{person.color} - #{person.birthdate.strftime('%m/%d')}" }
	end
end