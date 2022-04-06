# Sequel is a DB toolkit for Ruby that uses DSL (domain-specific language) to abstract
# away some of the details of using a database. Using Sequel, you can switch between 
# databases and it should continue to work 

require 'sequel'
require 'pg'

DB = Sequel.connect('postgres://postgres:password@localhost:5050/ruby_app')
DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert( :first_name => "Fred", :last_name => "Bloggs", :age => 32 )
puts "There are #{people.count} people in the database"
people.each do |person|
  puts person[:first_name]
end
DB.fetch("SELECT * FROM people") do |row|
  puts row[:first_name]
end