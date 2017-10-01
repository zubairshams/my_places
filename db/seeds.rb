# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'john@example.com', password: '123456')
user2 = User.create(email: 'doe@example.com', password: '123456')
user3 = User.create(email: 'doe@example.com', password: '123456')
user1.friends = [user2, user3]
user2.friends = [user1, user3]
user3.friends = [user1, user2]
