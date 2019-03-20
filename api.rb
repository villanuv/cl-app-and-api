require 'sinatra'
require 'json'
require './person'
require './interface'


get '/' do
	'Guaranteed Rate API'
end

get '/records/gender' do
	interface = Interface.new
	interface.load_data("people.csv")
	interface.load_data("people_pipe.csv")
	interface.load_data("people_space.csv")

	all_records = interface.sort_by_gender_and_last_name
	all_records.map do |person| 
		{
			first_name: person.first_name,
			last_name: person.last_name,
			gender: person.gender,
			color: person.color,
			birthdate: person.birthdate.strftime("%m/%d/%Y")
		}
	end.to_json
end

get '/records/birthdate' do
	interface = Interface.new
	interface.load_data("people.csv")
	interface.load_data("people_pipe.csv")
	interface.load_data("people_space.csv")

	all_records = interface.sort_by_birthdate
	all_records.map do |person| 
		{
			first_name: person.first_name,
			last_name: person.last_name,
			gender: person.gender,
			color: person.color,
			birthdate: person.birthdate.strftime("%m/%d/%Y")
		}
	end.to_json
end