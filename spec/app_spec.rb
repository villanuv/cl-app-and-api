require './app'

describe Person do

	describe "#initialize" do
		before do
			@person = Person.new("John", "Smith", "male", "gray", "01/01/1950")
		end

		it "creates a Person object" do
			expect(@person).to be_a Person
		end

		it "assigns @first_name" do
			expect(@person.first_name).to eq "John"
		end

		it "assigns @last_name" do
			expect(@person.last_name).to eq "Smith"
		end

		it "assigns @gender" do
			expect(@person.gender).to eq "male"
		end

		it "assigns @color" do
			expect(@person.color).to eq "gray"
		end

		it "assigns @birthdate" do
			expect(@person.birthdate).to eq "01/01/1950"
		end
	end

end


describe Interface do
	before do
		@interface = Interface.new
	end

	describe "#initialize" do
		it "creates an Interface object" do
			expect(@interface).to be_an Interface
		end

		it "assigns @data to an empty array" do
			expect(@interface.data).to be_empty
		end
	end

	describe "#load_data" do
		before do
			@interface.load_data("people.csv")
		end

		it "uploads data from an external csv file" do
			all_names = @interface.data.map{ |person_object| "#{person_object.first_name} #{person_object.last_name}" }
			expect(all_names).to include "Dexter Cummerata"
		end

		it "uploads all data from an external csv file" do
			expect(@interface.data.count).to be 20
		end
	end

end