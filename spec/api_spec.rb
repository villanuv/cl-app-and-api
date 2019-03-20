ENV['APP_ENV'] = 'test'

require './api'
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

describe 'Guaranteed Rate API' do

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
	end

	it "GET /records/birthdate" do
		get '/records/birthdate'
		expect(last_response).to be_ok
	end

	it "GET /records/name" do
		get '/records/name'
		expect(last_response).to be_ok
	end

end