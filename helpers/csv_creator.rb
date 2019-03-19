require 'csv'
require 'faker'

CSV.open("people.csv", "wb") do |csv|
  20.times do
	  csv << [
	  	Faker::Name.last_name, 
	  	Faker::Name.first_name, 
	  	Faker::Gender.binary_type, 
	  	Faker::Color.color_name.split(" ").last,
	  	Faker::Date.birthday(10, 100).strftime("%m/%d/%Y")
	  ]
  end
end