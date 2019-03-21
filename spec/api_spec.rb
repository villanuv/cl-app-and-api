ENV['APP_ENV'] = 'test'

require './api'
require 'rspec'
require 'rack/test'


describe 'Guaranteed Rate API' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	describe "homepage" do
		it "starter route included" do
			get '/'
			expect(last_response).to be_ok
			expect(last_response.body).to eq 'Guaranteed Rate API'
		end
	end

	describe "POST /records" do
		xit "appends comma-delimited data to @interface.data" do
			interface = Interface.new
			interface.load_data("people.csv")
			comma_delimited_string = "Smith,John,Male,gray,01/01/1950"
			post '/records', person: comma_delimited_string
		    expect(last_response).to be_ok
		end

		xit "appends pipe-delimited data to @interface.data" do
			interface = Interface.new
			interface.load_data("people.csv")
			pipe_delimited_string = "Smith | Jane | Female | yellow | 02/01/1950"
			post '/records', person: pipe_delimited_string
		    expect(last_response).to be_ok
		end

		xit "appends space-delimited data to @interface.data" do
			interface = Interface.new
			interface.load_data("people.csv")
			space_delimited_string = "Smith Joe Male red 03/01/1950"
			post '/records', person: space_delimited_string
		    expect(last_response).to be_ok
		end
	end

	describe "GET /records/gender" do
		before do
			get '/records/gender'
		end

		it "returns response" do
			expect(last_response).to be_ok
		end

		it "returns json" do
			body = JSON.parse(last_response.body)
			all_keys = body.map{ |person| person.keys }[0]
			expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
		end
	end

	describe "GET /records/birthdate" do
		before do
			get '/records/birthdate'
		end

		it "returns response" do
			expect(last_response).to be_ok
		end

		it "returns json" do
			body = JSON.parse(last_response.body)
			all_keys = body.map{ |person| person.keys }[0]
			expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
		end
	end


	describe "GET /records/name" do
		before do
			get '/records/name'
		end

		it "returns response" do
			expect(last_response).to be_ok
		end

		it "returns json" do
			body = JSON.parse(last_response.body)
			all_keys = body.map{ |person| person.keys }[0]
			expect(all_keys).to match_array(["first_name", "last_name", "gender", "color", "birthdate"])
		end
	end
end