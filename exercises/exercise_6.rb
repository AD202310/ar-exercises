require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Inside the Store model (app/models/store.rb)
class Store < ActiveRecord::Base
  has_many :employees
end

# Inside the Employee model (app/models/employee.rb)
class Employee < ActiveRecord::Base
  belongs_to :store
end

# Example of creating an employee for @store1 (Metropolis)
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)

# Creating more employees for @store1 (Metropolis)
@store1.employees.create(first_name: "John", last_name: "Doe", hourly_rate: 50)
@store1.employees.create(first_name: "Jane", last_name: "Smith", hourly_rate: 55)

# Creating employees for @store2 (Richmond)
@store2.employees.create(first_name: "Alice", last_name: "Johnson", hourly_rate: 65)
@store2.employees.create(first_name: "Bob", last_name: "Williams", hourly_rate: 70)

# Check the employees associated with @store1
puts "Employees at #{@store1.name}:"
@store1.employees.each do |employee|
  puts "#{employee.first_name} #{employee.last_name}, Hourly Rate: #{employee.hourly_rate}"
end

# Check the employees associated with @store2
puts "\nEmployees at #{@store2.name}:"
@store2.employees.each do |employee|
  puts "#{employee.first_name} #{employee.last_name}, Hourly Rate: #{employee.hourly_rate}"
end