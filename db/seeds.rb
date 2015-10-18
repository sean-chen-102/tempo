# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Set up Users
sally = { name: 'Sally', email: 'sally@mail.com', password: 'password' }
ben = { name: 'Ben', email: 'ben@mail.com', password: 'password'}
users = User.create([sally, ben]) # create the users

# Set up Interests
math = { name: 'Math' }
news = { name: 'News' }
fitness = { name: 'Fitness' }
science = { name: 'Science' }
technology = { name: 'Technology' }
movies = { name: 'Movies' }
interests = Interest.create()

# Set up Activities


# Set up CustomActivities


