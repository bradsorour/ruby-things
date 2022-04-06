# PStore library allows you to use Ruby objects and data structures as you normally
# would and then store them in a file. Later on, you can re-load the objects back
# into memory from the disk file (i.e. object persistence using marshalling technique)

class Person
    attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45
laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

# With PStore write objects to file
require 'pstore'
store = PStore.new("storagefile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end

# Retrieve the data from the PStore database
require 'pstore'
store = PStore.new("storagefile")
people = []
store.transaction do
  people = store[:people]
end

# At this point the Person objects inside people can be treated
# as totally local objects.
people.each do |person|
  puts person.name
end





