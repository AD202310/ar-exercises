require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Create three more stores
Store.create(
  id: 4,
  name: 'Surrey',
  annual_revenue: 224000,
  mens_apparel: false,
  womens_apparel: true
)

Store.create(
  id: 5,
  name: 'Whistler',
  annual_revenue: 1900000,
  mens_apparel: true,
  womens_apparel: false
)

Store.create(
  id: 6,
  name: 'Yaletown',
  annual_revenue: 430000,
  mens_apparel: true,
  womens_apparel: true
)

# Fetch stores that carry men's apparel and assign to @mens_stores
@mens_stores = Store.where(mens_apparel: true)

puts "Men's Apparel Stores:"
@mens_stores.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end

# Fetch stores that carry women's apparel and generate less than $1M in annual revenue
@womens_stores_under_1m = Store.where(womens_apparel: true, annual_revenue: 0..999999)

puts "\nWomen's Apparel Stores Under $1M Annual Revenue:"
@womens_stores_under_1m.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end
