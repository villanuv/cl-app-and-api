require 'spec_helper'
require './person'

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
			date = @person.birthdate.strftime("%m/%d/%Y")
			expect(date).to eq "01/01/1950"
		end
	end

end