# Guaranteed Rate Code Challenge

Create a command line app that takes as input a file with a set of records in one of three formats described below, and outputs (to the screen) the set of records sorted in one of three ways.

## Step 1 - Build a system to parse and sort a set of records

**Input**

A record consists of the following 5 fields: last name, first name, gender, date of birth and favorite color. The input is 3 files, each containing records stored in a different format. You may generate these files yourself, and you can make certain assumptions if it makes solving your problem easier.

-   The pipe-delimited file lists each record as follows:  
    LastName | FirstName | Gender | FavoriteColor | DateOfBirth
-   The comma-delimited file looks like this:  
    LastName, FirstName, Gender, FavoriteColor, DateOfBirth
-   The space-delimited file looks like this:  
    LastName FirstName Gender FavoriteColor DateOfBirth

You may assume that the delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves. Write a program in a language of your choice to read in records from these files and combine them into a single set of records.

**Output**

Create and display 3 different views of the data you read in:

-   Output 1 – sorted by gender (females before males) then by last name ascending.
-   Output 2 – sorted by birth date, ascending.
-   Output 3 – sorted by last name, descending.

Display dates in the format M/D/YYYY.

## Step 2 - Build a REST API to access your system

Tests for this section are required as well.

**Within the same code base**, build a standalone REST API with the following endpoints:

-   POST /records - Post a single data line in any of the 3 formats supported by your existing code
-   GET /records/gender - returns records sorted by gender
-   GET /records/birthdate - returns records sorted by birthdate
-   GET /records/name - returns records sorted by name

It's your choice how you render the output from these endpoints as long as it well structured data. These endpoints should return JSON.

To keep it simple, don't worry about using a persistent datastore.

## Developer Notes

For this challenge, I selected to use **Ruby v2.3.4**.

**For the Command Line app**

- cd into directory, and run `ruby app.rb`
- Tests loaded one csv to simplify manual verification

**For the API**
- cd into directory, and run `bundle install` to install gems (Sinatra, rack-test, rspec, json)
- Run `ruby api.rb`
- Assumed the same 3 methods from the Command Line app
- Methods were tested with the **Interface** class, so further method testing was unnecessary.

**For RSpec Testing**
- Run `rspec spec`

**Improvements to Make**
POST /records confused me in this configuration, and thought it should be working as expected. I'd probably inquire about this endpoint a bit further, and included pending tests.