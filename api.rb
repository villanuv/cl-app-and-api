require 'sinatra'
require 'json'
# require 'net/http'
require 'uri'
require './person'
require './interface'


before do
	@interface = Interface.new
	@interface.load_data("people.csv")
	@interface.load_data("people_pipe.csv")
	@interface.load_data("people_space.csv")
end

get '/' do
	'Guaranteed Rate API'
end

post '/records' do
	data = params['person']
	@interface.json_to_person(data)
end

get '/records/gender' do
	all_records = @interface.sort_by_gender_and_last_name
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
	all_records = @interface.sort_by_birthdate
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

get '/records/name' do
	all_records = @interface.sort_by_last_name_desc
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