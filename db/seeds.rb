# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    name: "テスト君#{n + 5}",
    email: "test#{n + 5}@gmail.com",
    password: "aaaaaaaaaa#{n + 5}"
  )
end

users = User.order(:created_at).take(3)
5.times do |n|
  Post.create!(
    room_name: "テストルーム#{n + 1}",
    room_PR: "快適な空間を提供します#{n + 1}",
    room_price: "5000#{n + 1}",
    room_address: "東京都品川区#{n + 1}"
  )
end

