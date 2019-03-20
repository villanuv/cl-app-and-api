ENV['APP_ENV'] = 'test'

require './api'
require 'rspec'
require 'rack/test'


describe 'Guaranteed Rate API' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "has a default homepage" do
		get '/'
		expect(last_response).to be_ok
		expect(last_response.body).to eq 'Guaranteed Rate API'
	end

	it "GET /records/gender" do
		get '/records/gender'
		expect(last_response).to be_ok
		body = JSON.parse(last_response.body)
		all_keys = body.map{ |person| person.keys }[0]
		expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
	end

	it "GET /records/birthdate" do
		get '/records/birthdate'
		expect(last_response).to be_ok
		all_keys = body.map{ |person| person.keys }[0]
		expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
	end

	it "GET /records/name" do
		get '/records/name'
		expect(last_response).to be_ok
		all_keys = body.map{ |person| person.keys }[0]
		expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
	end
end