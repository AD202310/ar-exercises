require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate :must_carry_apparel

  private

  def must_carry_apparel
    unless mens_apparel || womens_apparel
      errors.add(:base, "Stores must carry at least one of men's or women's apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

# Ask the user for store details
puts "Enter a store name:"
store_name = gets.chomp

# Ensure that the user input for annual revenue is a valid number
begin
  puts "Enter annual revenue:"
  annual_revenue = Integer(gets.chomp)
rescue ArgumentError
  puts "Error: Annual revenue must be a valid number."
  exit
end

puts "Does the store carry men's apparel? (true/false):"
mens_apparel = gets.chomp.downcase == 'true'

puts "Does the store carry women's apparel? (true/false):"
womens_apparel = gets.chomp.downcase == 'true'

# Attempt to create a store with the provided details
new_store = Store.new(
  id: Store.last.id + 1,
  name: store_name,
  annual_revenue: annual_revenue,
  mens_apparel: mens_apparel,
  womens_apparel: womens_apparel
)

# Display the error messages if the store cannot be saved
if new_store.save
  puts "Store successfully created!"
else
  puts "Error creating store. Please fix the following issues:"
  puts new_store.errors.full_messages.join("\n")
end

puts "New store: #{Store.last.id}: #{Store.last.name}"