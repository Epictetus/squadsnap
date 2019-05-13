# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_my_users
  # Create my normal user id: 1
  User.create(
    name: "weteamsteve",
    email: "weteamsteve@gmail.com",
    password: '12345',
    password_confirmation: '12345'
  )

  # Create my secondary user id: 2
  User.create(
    name: "ashley",
    email: "ashley@weteamsteve.com",
    password: '123456',
    password_confirmation: '123456'
  )
end

def seed_my_squads
  # Create a squad owned by my normal user
  Squad.create(
    name: "Boston Celtics",
    sport: "Basketball",
    owner_id: '1'
  )

  # Create a squad owned by secondary user
  Squad.create(
    name: "New England Patriots",
    sport: "Football",
    owner_id: '2'
  )
end

def seed_fake_users
  user_id = 3
  10.times do
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id += 1
  end
end

def seed_fake_squads
  num = 0
  3.times do
    Squad.create(
      name: "test_squad#{num}",
      sport: "test_sport#{num}",
      owner_id: '1'
    )
    num += 1
  end

  num = 0
  3.times do
    Squad.create(
      name: "other_squad#{num}",
      sport: "other_sport#{num}",
      owner_id: '2'
    )
    num += 1
  end
end

seed_my_users
seed_fake_users

#if Rails.env.development?
  #seed_my_squads
  #seed_fake_squads
#end
