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