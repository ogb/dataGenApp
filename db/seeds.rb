# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# add the god account
#newUserSalt = BCrypt::Engine.generate_salt
#newUserPass = BCrypt::Engine.hash_secret("test", newUserSalt)
u = User.create :email => "ogb", :salt => 'notyet', :password => 'test', :password_confirmation => 'test'

# vince's account
u = User.create :email => "vin", :salt => 'soonMy', :password => 'test11', :password_confirmation => 'test11'
