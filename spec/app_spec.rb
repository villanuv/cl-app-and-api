require './app'

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
		it "uploads data from an external comma-delimited csv file" do
			@interface.load_data("people.csv")
			all_names = @interface.data.map{ |person_object| "#{person_object.first_name} #{person_object.last_name}" }
			expect(all_names).to include "Dexter Cummerata"
		end

		it "uploads data from an external pipe-delimited csv file" do
			@interface.load_data("people_pipe.csv")
			all_names = @interface.data.map{ |person_object| "#{person_object.first_name} #{person_object.last_name}" }
			expect(all_names).to include "Denver Steuber"					
		end

		it "uploads data from an external space-delimited csv file" do
			@interface.load_data("people_space.csv")
			all_names = @interface.data.map{ |person_object| "#{person_object.first_name} #{person_object.last_name}" }
			expect(all_names).to include "Neil Armstrong"					
		end		

		it "uploads all data from external csv files" do
			@interface.load_data("people.csv")
			@interface.load_data("people_pipe.csv")
			@interface.load_data("people_space.csv")
			expect(@interface.data.count).to be 60
		end
	end

end