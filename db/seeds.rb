# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'user', :email => 'user@example.com', :password => 'onelove', :password_confirmation => 'onelove'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'user2', :email => 'user2@example.com', :password => 'onelove', :password_confirmation => 'onelove'
puts 'New user created: ' << user2.name
user.add_role :admin