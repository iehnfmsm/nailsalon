# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# データベースの初期化かつadminの設定
# bundle exec rake db:migrate:reset
# bundle exec rake db:seed
User.create!(name:  "Admin",
  email: "admin@admin",
  password:              "111111",
  password_confirmation: "111111",
  birthday: "1992-05-29",
  admin: true)


  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "111111"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 birthday: "1990-04-28")
  end